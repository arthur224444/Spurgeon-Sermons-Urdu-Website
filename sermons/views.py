from django.db import models
from django.shortcuts import render
from django.views.generic import DetailView, ListView

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


def sermon_search(request):
    query = request.GET.get("q", "")
    if query:
        sermons = Sermon.objects.filter(
            models.Q(title__icontains=query)
            | models.Q(content__icontains=query)
            | models.Q(scripture_reference__icontains=query)
        )
    else:
        sermons = Sermon.objects.none()

    return render(
        request, "sermons/sermon_search.html", {"sermons": sermons, "query": query}
    )
