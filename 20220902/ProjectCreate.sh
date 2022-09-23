#!/bin/bash
currentDir=$(pwd)


source ${currentDir}/Scripts/activate
source ${currentDir}/bin/activate
cd ${currentDir}
read -p "Enter Project Name: " projectName
django-admin startproject ${projectName}
cd ${projectName}
python manage.py startapp ${projectName}app
mkdir static
mkdir templates
cd ${projectName}
sed -i -e '28s/.*/ALLOWED_HOSTS = [\x27*\x27]'/ settings.py
sed -i -e "40s/.*/    \x27${projectName}app\x27,"/ settings.py
sed -i -e '41s/.*/]'/ settings.py
sed -i -e '57s/.*/\x27DIRS\x27: [BASE_DIR,\x27templates\x27],'/ settings.py
sed -i -e '106s/.*/LANGUAGE_CODE = \x27zh-Hant\x27'/ settings.py
sed -i -e '108s/.*/TIME_ZONE = \x27Asia\/Taipei\x27'/ settings.py

cd ${currentDir}/${projectName}

python manage.py makemigrations ${projectName}app
python manage.py migrate
read -p "Enter Available Server Port:" port
python manage.py runserver 0.0.0.0:${port}