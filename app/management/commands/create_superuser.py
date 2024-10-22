from django.core.management.base import BaseCommand
from django.contrib.auth import get_user_model
from django.conf import settings

User = get_user_model()

class Command(BaseCommand):
    help = '创建超级用户'

    def handle(self, *args, **options):
        if not User.objects.filter(username=settings.SUPERUSER_NAME).exists():
            User.objects.create_superuser(
                username=settings.SUPERUSER_NAME,
                email=settings.SUPERUSER_EMAIL,
                password=settings.SUPERUSER_PASSWORD,
            )
            self.stdout.write(self.style.SUCCESS('超级用户已创建'))
        else:
            self.stdout.write(self.style.WARNING('超级用户已存在'))
