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
    
#### Build
````
docker build . --pull --build-arg VERSION=22.04 --tag YOUR_TAG --progress=plain --no-cache
````
