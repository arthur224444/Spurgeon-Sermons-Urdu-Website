from django.db import models
from django.urls import reverse
from django.utils import timezone


class Sermon(models.Model):
    id = models.BigAutoField(
        auto_created=True, primary_key=True, serialize=False, verbose_name="ID"
    )
    title_english = models.CharField(max_length=200, default="Untitled Sermon")
    title_urdu = models.CharField(max_length=200, default="Untitled Sermon")
    preacher_name_english = models.CharField(
        max_length=100, default="Charles H. Spurgeon"
    )
    preacher_name_urdu = models.CharField(max_length=100, default="چارلس سپرژن")
    content = models.TextField()
    date_preached = models.DateField(default=timezone.now)
    bible_passage_english = models.CharField(max_length=200, blank=True)
    bible_passage_urdu = models.CharField(max_length=200, blank=True)
    sermon_number = models.IntegerField(unique=True, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ["-date_preached"]

    def __str__(self):
        return f"{self.title_english} - {self.preacher_name_english}"

    def get_absolute_url(self):
        return reverse("sermon_detail", args=[str(self.id)])
