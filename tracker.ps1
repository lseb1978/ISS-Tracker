## ISS Tracker in PowerShell

## International Space Station (ISS)
## NORAD ID: 25544

Clear

$url = "https://api.wheretheiss.at/v1/satellites/25544"

try {
    $data = Invoke-RestMethod -Uri $url -UseBasicParsing
    Write-Host "Récupération des données de l'ISS..."

    $data
}
catch {
    Write-Host "Impossible de récupérer les données de l'ISS. Veuillez vérifier votre connexion Internet." -ForegroundColor Red
    Exit
}

$data.latitude = $data.latitude -replace ',','.' 
$data.longitude = $data.longitude -replace ',','.' 

$googlemapsurl = 'https://maps.google.com/maps?q='+$data.latitude+','+$data.longitude+'&z=1'

$ie = Start-Process microsoft-edge:$googlemapsurl -PassThru
if ($ie -ne $null) {
    Write-Host "Ouverture de Google Maps..."
    Sleep 2
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.AppActivate('Google - Microsoft Edge')
    Sleep 2
    $wshell.SendKeys('{F11}')
}
else {
    Write-Host "Impossible d'ouvrir Google Maps. Veuillez vérifier que Microsoft Edge est installé sur votre ordinateur." -ForegroundColor Red
}
