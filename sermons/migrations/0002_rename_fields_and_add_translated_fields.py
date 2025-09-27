from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("sermons", "0001_initial"),
    ]

    operations = [
        migrations.RenameField(
            model_name="sermon",
            old_name="title",
            new_name="title_english",
        ),
        migrations.RenameField(
            model_name="sermon",
            old_name="preacher",
            new_name="preacher_name_english",
        ),
        migrations.RenameField(
            model_name="sermon",
            old_name="scripture_reference",
            new_name="bible_passage_english",
        ),
        migrations.AddField(
            model_name="sermon",
            name="title_urdu",
            field=models.CharField(max_length=200, default="Untitled Sermon"),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name="sermon",
            name="preacher_name_urdu",
            field=models.CharField(max_length=100, default="چارلس سپرژن"),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name="sermon",
            name="bible_passage_urdu",
            field=models.CharField(max_length=200, blank=True, default=""),
            preserve_default=False,
        ),
    ]
