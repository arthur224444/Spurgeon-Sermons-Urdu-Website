from django.contrib import admin

from .models import Sermon


@admin.register(Sermon)
class SermonAdmin(admin.ModelAdmin):
    list_display = (
        "title",
        "preacher",
        "date_preached",
        "scripture_reference",
        "sermon_number",
        "created_at",
    )
    list_filter = ("preacher", "date_preached", "created_at")
    search_fields = ("title", "content", "scripture_reference")
    readonly_fields = ("created_at", "updated_at")
    date_hierarchy = "date_preached"
    ordering = ("-date_preached",)

    fieldsets = (
        ("Basic Information", {"fields": ("title", "preacher", "content")}),
        (
            "Details",
            {"fields": ("date_preached", "scripture_reference", "sermon_number")},
        ),
        (
            "Timestamps",
            {"fields": ("created_at", "updated_at"), "classes": ("collapse",)},
        ),
    )
