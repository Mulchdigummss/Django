$currentdir = get-location

.\Scripts\activate
$projectName = Read-Host "Enter Project Name: "
django-admin startproject ${projectName}
Set-Location ${projectName}
python manage.py startapp ${projectName}app
mkdir static
mkdir templates
Set-Location ${projectName}

# $content = Get-Content .\settings.py
# $content[40] = "'n"
# $content | Out-File .\settings.py 

$content = Get-Content .\settings.py
$content[27] = "ALLOWED_HOSTS = ['*']"
$content[39] = "'${projectName}app',"
$content[40] = "]"
$content[56] = "'DIRS': [BASE_DIR,'templates'],"
$content[105] = "LANGUAGE_CODE = 'zh-Hant'"
$content[107] = "TIME_ZONE = 'Asia/Taipei'"
$content[118] = "STATIC_DIR = BASE_DIR / 'static'"
$content | Set-Content .\settings.py

Set-Location ${currentDir}/${projectName}

python manage.py makemigrations ${projectName}app
python manage.py migrate
$port = Read-Host "Enter Available Server Port:" 
python manage.py runserver 0.0.0.0:${port}
