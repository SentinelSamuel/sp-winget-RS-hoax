# Reverse-Shell with winget

### AFTER INSTALLING AND DOING EVERYTHING IN THE sp-hoaxshell
Winget.ps1 & winget-manifest.yml --> upload on the target machine

## Installation & configuration before the start :
```
git clone https://github.com/SentinelSamuel/sp-winget-RS-hoax.git

 
``` 
```
sudo bash change-sha256.sh
```

# sp-hoaxshell
Copy of the real Hoaxshell (https://github.com/t3l3machus/hoaxshell) with modifications to automatise everything
& see : https://github.com/SentinelSamuel/sp-hoaxshell


## Installation + configuration before the start
```
git clone https://github.com/t3l3machus/hoaxshell.git
sudo rm ./hoaxshell/hoaxshell.py
git clone https://github.com/SentinelSamuel/sp-hoaxshell.git
sudo mv ./sp-hoaxshell/hoaxshell.py ./hoaxshell
sudo mv ./sp-hoaxshell/sp-hoax/ ./
sudo rm -rf ./sp-hoaxshell
sudo pip3 install -r ./hoaxshell/requirements.txt
chmod +x ./hoaxshell/hoaxshell.py
cd sp-hoax/
```

### 1) Start Python server
```
# maybe a sudo before ?
bash python-server-1.sh
```
### 2) Start hoaxshell
```
# maybe a sudo before ?
bash hoaxshell-2.sh  
```
### 3) Make the info file correct
```
# maybe a sudo before ?
pwsh info-3.ps1
```
