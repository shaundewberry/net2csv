#!/usr/bin/ksh
#print "Host,Interface,IP Address,MAC Address,Link Status,Negotiation,Link Duplex & Speed"

for i in `ifconfig -l`; do
 if [[ $i != "lo0" ]];then
    print `uname -n`"," $i", \c";
    print `netstat -n -I $i | grep -v link | awk '{print $4}' | tail -1`", \c";
    print `netstat -n -I $i | grep link | awk '{printf "%s", $4}' | tail -1`", \c";
    print `entstat -d $i | grep Link | awk '{print $3}'`", \c";
    entstat -d $i | grep Speed | head -1 | awk -F': ' '{printf "\"%s\", " , $2}';
    entstat -d $i | grep Speed | tail -1 | awk -F': ' '{printf "\"%s\"\n" , $2}';
 fi
done
