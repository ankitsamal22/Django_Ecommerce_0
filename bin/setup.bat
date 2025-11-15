@echo off
REM Django E-commerce Setup - Python 3.14 Compatible (Django 4.2)

cd /d %~dp0\..

echo ========================================
echo Django E-commerce Setup
echo Python 3.14 Compatible - Django 4.2
echo ========================================
echo.

python --version
echo.

REM Delete old environment if exists
IF EXIST env (
    echo Removing old virtual environment...
    rmdir /s /q env
)

REM Create fresh virtual environment
echo Creating new virtual environment...
python -m venv env

REM Activate
call env\Scripts\activate.bat

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip setuptools wheel

echo.
echo ========================================
echo Installing Django 4.2 (Python 3.14 OK)
echo ========================================
echo.

REM Install Django 4.2 (compatible with Python 3.14)
pip install "Django>=4.2,<5.0"

REM Install other dependencies
pip install django-allauth
pip install django-crispy-forms
pip install crispy-bootstrap4
pip install django-countries
pip install stripe
pip install Pillow
pip install python3-openid
pip install requests-oauthlib

echo.
echo ========================================
echo Running Migrations
echo ========================================
echo.

python manage.py makemigrations
python manage.py migrate

IF %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Setup Complete
    echo ========================================
) ELSE (
    echo.
    echo ========================================
    echo Setup had some errors
    echo But Django 4.2 is installed!
    echo ========================================
)

echo.
echo ========================================
echo CODE CHANGES REQUIRED:
echo ========================================
echo.
echo 1. In settings.py ADD:
echo    DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
echo    CSRF_TRUSTED_ORIGINS = ['http://localhost:8000', 'http://127.0.0.1:8000']
echo.
echo 2. In INSTALLED_APPS ADD:
echo    'crispy_forms',
echo    'crispy_bootstrap4',
echo.
echo 3. ADD crispy template pack:
echo    CRISPY_TEMPLATE_PACK = 'bootstrap4'
echo.
echo 4. Update any url() imports to path()
echo.
echo ========================================
echo Next Steps:
echo ========================================
echo.
echo 1. Make the code changes above
echo 2. python manage.py createsuperuser
echo 3. python manage.py runserver
echo 4. Visit: http://127.0.0.1:8000
echo.

pause