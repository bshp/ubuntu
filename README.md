#### Docker Core Image  
Base image for our containers
    
#### Base OS:    
Ubuntu Server LTS
    
#### Packages:    
Updated weekly from the official upstream Ubuntu LTS image
````
ca-certificates 
curl 
gnupg 
jq 
openssl 
tzdata 
unzip 
wget
````
    
#### Tags
[Docker Hub](https://hub.docker.com/r/bshp/base/tags)
    
#### Build Args
TZ: - https://manpages.ubuntu.com/manpages/man3/DateTime::TimeZone::Catalog.3pm.html    
VERSION: - https://hub.docker.com/_/ubuntu/tags
    
#### Required Args
````
--build-arg VERSION
````
#### Build
````
docker build . --build-arg VERSION=22.04 --pull --tag YOUR_TAG --progress=plain --no-cache
````
