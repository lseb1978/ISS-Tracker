## ISS Tracker in PorwerShell

##  International Space Station (ISS) 
##  NORAD ID: 25544 

Clear

$url = "https://api.wheretheiss.at/v1/satellites/25544"

$data = Invoke-RestMethod $url -Method GET 


$data
