from django.db import models
from django.http import Http404
from django.shortcuts import render
from django.utils import timezone
from django.views.generic import DetailView, ListView

from .data_connection import DataConnection
from .models import Sermon

# Create your views here.


class SermonListView(ListView):
    model = Sermon
    template_name = "sermons/sermon_list.html"
    context_object_name = "sermons"
    paginate_by = 10


class SermonDetailView(DetailView):
    model = Sermon
    template_name = "sermons/sermon_detail.html"
    context_object_name = "sermon"

    def get_object(self, queryset=None):
        # Try to get from Django DB first
        try:
            return super().get_object(queryset)
        except Http404:
            # If not in Django DB, try to fetch from API and create
            sermon_id = self.kwargs.get("pk")
            return self._fetch_and_create_sermon(sermon_id)

    def _fetch_and_create_sermon(self, sermon_id):
        """Fetch sermon from API and create a temporary Sermon object for display"""
        data_conn = DataConnection()
        sermon_data = data_conn.get_sermon_full_details(sermon_id)

        if not sermon_data:
            raise Http404("Sermon not found")

        # Create a temporary Sermon object from API data for display
        # This doesn't save to database, just creates an object for the template
        sermon = Sermon(
            id=sermon_id,
            title=sermon_data.get("title", "Untitled Sermon"),
            preacher=sermon_data.get("preacher", "Charles H. Spurgeon"),
            content=sermon_data.get("content", ""),
            scripture_reference=sermon_data.get("bible_passage", ""),
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
        data_conn = DataConnection()
        sermon_numbers = data_conn.search_sermons(query)

        for sermon_num in sermon_numbers[:10]:
            sermon_data = data_conn.get_sermon_basic_details(sermon_num)
            if sermon_data:
                # map API id to what the template expects
                sermon_data["pk"] = sermon_data["spurgeon_gems_number"]
                sermons.append(sermon_data)

    # (optional) don't overwrite the file each loop
    if sermons:
        with open("test3.txt", "w") as f:
            for s in sermons:
                f.write(str(s) + "\n")

    return render(
        request, "sermons/sermon_search.html", {"sermons": sermons, "query": query}
    )
