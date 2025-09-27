from django.core.paginator import EmptyPage, Page, PageNotAnInteger, Paginator
from django.db import DatabaseError, models
from django.db.utils import OperationalError
from django.http import Http404
from django.shortcuts import render
from django.utils import timezone
from django.views.generic import DetailView, View

from .data_connection import DataConnection
from .models import Sermon

data_conn = DataConnection()
# Create your views here.


class SermonListView(View):
    # model = Sermon
    template_name = "sermons/sermon_list.html"
    # context_object_name = "sermons"
    paginate_by = 10

    def get(self, request, *args, **kwargs):
        q = (request.GET.get("q") or "").strip()
        page_number_raw = request.GET.get("page", 1)

        try:
            page_number = int(page_number_raw)
            if page_number < 1:
                raise ValueError
        except ValueError:
            page_number = 1

        all_sermon_numbers = data_conn.get_all_sermons_numbers()
        sermons = data_conn.get_sermons_list_page_number(page_number, self.paginate_by)
        paginator = Paginator(range(len(all_sermon_numbers)), self.paginate_by)
        try:
            page = paginator.page(page_number)
        except (EmptyPage, PageNotAnInteger):
            # If page is out of range, show last page
            last_page = paginator.num_pages
            page = paginator.page(last_page)
            sermons = data_conn.get_sermons_list_page_number(
                last_page, self.paginate_by
            )

        context = {
            "sermons": sermons,
            "page_obj": page,
            "is_paginated": paginator.num_pages > 1,
            "paginator": paginator,
            "q": q,
        }

        return render(request, self.template_name, context)


class SermonDetailView(DetailView):
    model = Sermon
    template_name = "sermons/sermon_detail.html"
    context_object_name = "sermon"

    def get_object(self, queryset=None):
        # Try to get from Django DB first
        try:
            return super().get_object(queryset)
        except (Http404, DatabaseError, OperationalError):
            # If not in Django DB, try to fetch from API and create
            sermon_id = self.kwargs.get("pk")
            return self._fetch_and_create_sermon(sermon_id)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Check if user came from search results
        context["from_search"] = self.request.GET.get("from_search", False)
        context["search_query"] = self.request.GET.get("q", "")
        return context

    def _fetch_and_create_sermon(self, sermon_id):
        """Fetch sermon from API and create a temporary Sermon object for display"""
        sermon_data = data_conn.get_sermon_full_details(sermon_id)

        if not sermon_data:
            raise Http404("Sermon not found")

        # Create a temporary Sermon object from API data for display
        # This doesn't save to database, just creates an object for the template
        sermon = Sermon(
            id=sermon_id,
            title_english=sermon_data.get("title_english", "Untitled Sermon"),
            title_urdu=sermon_data.get("title_urdu", "Untitled Sermon"),
            preacher_name_english=sermon_data.get(
                "preacher_name_english", "Charles H. Spurgeon"
            ),
            preacher_name_urdu=sermon_data.get("preacher_name_urdu", "چارلس سپرژن"),
            bible_passage_english=sermon_data.get("bible_passage_english", ""),
            bible_passage_urdu=sermon_data.get("bible_passage_urdu", ""),
            content=sermon_data.get("content", ""),
            sermon_number=sermon_data.get("spurgeon_gems_number", sermon_id),
        )

        # Set date_preached if available in API data
        if "date_preached" in sermon_data and sermon_data["date_preached"]:
            try:
                from datetime import datetime

                sermon.date_preached = datetime.strptime(
                    sermon_data["date_preached"], "%Y-%m-%d"
                ).date()
            except (ValueError, TypeError):
                sermon.date_preached = timezone.now().date()
        else:
            sermon.date_preached = timezone.now().date()

        return sermon


def sermon_search(request):
    query = request.GET.get("q", "")
    sermons = []

    if query:
        sermon_numbers = data_conn.search_sermons(query)

        for sermon_num in sermon_numbers[:10]:
            sermon_data = data_conn.get_sermon_basic_details(sermon_num)
            if sermon_data:
                # map API id to what the template expects
                sermon_data["pk"] = sermon_data["spurgeon_gems_number"]
                sermons.append(sermon_data)

    return render(
        request, "sermons/sermon_search.html", {"sermons": sermons, "query": query}
    )
