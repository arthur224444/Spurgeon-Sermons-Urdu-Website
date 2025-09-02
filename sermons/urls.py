from django.urls import path

from . import views

app_name = "sermons"

urlpatterns = [
    path("", views.SermonListView.as_view(), name="sermon_list"),
    path("<int:pk>/", views.SermonDetailView.as_view(), name="sermon_detail"),
    path("search/", views.sermon_search, name="sermon_search"),
]
