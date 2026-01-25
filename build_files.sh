#!/bin/bash
echo "=== Collecting static files ==="
python manage.py collectstatic --noinput --clear
echo "=== Static files collected ==="