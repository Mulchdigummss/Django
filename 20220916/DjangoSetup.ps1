$currentdir = Get-Location
#建置虛擬環境
pip install virtualenv
$envname = Read-Host "Enter a name for the virtual environment"  
virtualenv $envname
Copy-Item .\ProjectCreate.ps1 .\$envname
# 啟動虛擬環境
Set-Location $currentdir/$envname
./Scripts/activate
#虛擬環境安裝套件
pip install Django 
pip install mysqlclient
pip install autopep8
pip install Pyrebase4

# Set-Location ..
# Copy-Item .\ProjectCreate.ps1 .\$envname
# Set-Location $envname