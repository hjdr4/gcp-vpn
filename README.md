# Overview
This container provides a customer endpoint for Google Cloud Platform (GCP) VPN.  
It includes IPSEC tunnel, BGP routes distribution and OSPF routes redistribution.  

# Usage
Prepare your configuration file `vars.yml`. Look at `content/ansible/vars.yml` for an example.  
You can replace the file directly or bind mount the configuration.  

Build the container:
```
docker build -t gcp-vpn .
```

Then start the container : 
```
docker run -it --privileged --net=host -v /docker/gcp-vpn/vars.yml:/ansible/vars.yml gcp-vpn
```
This will start the container foreground.


When your are sastisfied with your configuration, launch the container background: 
```
docker run -d --restart=always --privileged --net=host -v /docker/gcp-vpn/vars.yml:/ansible/vars.yml gcp-vpn
```

# Implementation details
This project uses `Strongswan` as IPSEC provider and `Quagga` for routing.  
It creates a `vti` interface to make tcpdump and other tools easy to use.  


