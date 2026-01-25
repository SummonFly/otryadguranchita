import os
from django.core.wsgi import get_wsgi_application
from whitenoise import WhiteNoise

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'SVO.settings')
application = get_wsgi_application()

from django.conf import settings
application = WhiteNoise(application, root=settings.STATIC_ROOT)