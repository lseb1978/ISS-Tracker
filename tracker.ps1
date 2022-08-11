## ISS Tracker in PorwerShell

##  International Space Station (ISS) 
##  NORAD ID: 25544 

Clear

$url = "https://api.wheretheiss.at/v1/satellites/25544"

$data = Invoke-RestMethod $url -Method GET 


$data

$data.latitude = $data.latitude -replace ',','.' 
$data.longitude = $data.longitude -replace ',','.' 


$googlemapsurl = 'https://maps.google.com/maps?q='+$data.latitude+','+$data.longitude+'&z=1'


start microsoft-edge:$googlemapsurl
$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Google - Microsoft Edge')
Sleep 2
$wshell.SendKeys('{F11}')
