from django.db import models
from django.utils import timezone


class Sermon(models.Model):
    title = models.CharField(max_length=200)
    preacher = models.CharField(max_length=100, default="Charles H. Spurgeon")
    content = models.TextField()
    date_preached = models.DateField(default=timezone.now)
    scripture_reference = models.CharField(max_length=200, blank=True)
    sermon_number = models.IntegerField(unique=True, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ["-date_preached"]

    def __str__(self):
        return f"{self.title} - {self.preacher}"

    def get_absolute_url(self):
        from django.urls import reverse

        return reverse("sermon_detail", args=[str(self.id)])
