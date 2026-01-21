#!/bin/bash

echo "=== BUILD START ==="

# Установка зависимостей
echo "Installing dependencies..."
pip install -r requirements.txt

# Сбор статики
echo "Collecting static files..."
python manage.py collectstatic --noinput --clear

# Проверка собранных файлов
echo "=== Checking static files ==="
if [ -d "staticfiles" ]; then
    echo "staticfiles directory exists with:"
    find staticfiles -type f | head -20
    echo "Total files in staticfiles: $(find staticfiles -type f | wc -l)"

    # Проверка конкретных файлов
    echo ""
    echo "Looking for specific files:"
    [ -f "staticfiles/style.css" ] && echo "✓ style.css found" || echo "✗ style.css NOT found"
    [ -f "staticfiles/images/logo.png" ] && echo "✓ logo.png found" || echo "✗ logo.png NOT found"
else
    echo "ERROR: staticfiles directory NOT created!"
fi

echo "=== BUILD END ==="