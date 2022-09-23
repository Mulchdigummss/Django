sudo apt update -y
sudo apt upgrade -y
sudo apt-get install python -y
sudo apt-get install python3 -y
sudo apt install python3-pip -y

sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 2
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1

sudo pip install virtualenv 
sudo pip install Django 

currentDir = $(pwd)
read -p "Enter the name of the virtual environment: " venv_name
virtualenv ${venv_name}
sudo cp ProjectCreate.sh ${currentDir}/${venv_name}
cd ${currentDir}/${venv_name}
source bin/activate
pip install Django
deactivate
source ProjectCreate.sh





