# Examples - Lecture 5

## Local Configuration - Network

    ifconfig
    
Tell me about the network configuration for this machine.

> `ipconfig` will do the same thing roughly on Windows.

    ip addr
    
Tell me about the network information / configuration on this machine.

> Note that this is Linux specific.  

    netstat -ra

Tell me about the routing configuration.  Typically, this is split up by subnets (172.168.3.0).  The default line tells you where your traffic will go by default.

    netstat -a
    
Tell me about all of the network connections to / from on this machine.

    netstat -v
    
Provide a verbose output telling me about the PID and other information about all of the network connections.

    ss -tulnp
    
Much like `ip addr` is the new style for ifconfig, `ss` is the new style for `netstat`.

## Domain Name Service / Hostnames

    dig nd.edu
    host nd.edu
    nslookup nd.edu
    
This will query the local DNS server (or continue on) to resolve a domain name or hostname to an IP address.  A domain name is generally something like a TLD (top-level domain) like `.EDU` along with a different identifier (`ND.EDU`).  The hostname is usually something in front of the domain name, e.g. `www.nd.edu`.  

   dig 34.193.237.201
   
The same commands can be used to conduct what is known as a reverse lookup.  A reverse lookup tries to determine one of the hostnames associated with a given IP address.

## Accessing the Web / Remote Machines

    curl https://www.nd.edu/
     
Fetch different parts of a website and sent it to STDOUT.
     
    wget http://www.nd.edu/

Fetch a particular file from a website.

    telnet 192.168.0.1 80
    
Provide a terminal interface without encryption for port 80.       

    nc www.google.com 80
    
Provide a similar input / output on a particular port using netcat.

    ssh striegel@student10.cse.nd.edu
    
Create a secure shell into a particular machine

    scp striegel@student10.cse.nd.edu:Test.tar .
    
Securely copy down a particular file

    rsync -av --progress folder remote:path
    
Synchronize a local folder with a remote folder on a different machine.

## Measuring Performance / Troubleshooting

    iperf iperf.par2.as49434.net
    
Measure the Internet performance using that remote host (`iperf.par2.as49434.net`).

    ping www.google.com
    
Check to see if a host is reachable by sending an ICMP ping.

    traceroute www.google.com
    
Monitor / watch the path your packets will take when going to the remote site.

    nmap MYSERVERTOSCAN.edu
    
Scan a given server to see which ports are open.

    tcpdump -i en0 host 129.74.20.40
    
Capture all packets crossing interface `en0` that involve the host with the IP `129.74.20.40`.   
