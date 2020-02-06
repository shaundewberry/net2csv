#!/bin/sh
# Prints hostname, host type, each interface with IP, MAC, Status, Auto Negotiation On or Off, and Link Speed and Duplex

#echo "Host,Type,Interface,IP Address,MAC Address,Link Status,Auto Negotiation,Link Duplex & Speed"
export PATH=$PATH:/sbin:/usr/sbin

for i in $(cat /proc/net/dev | sed '1,2d' | awk -F':' '{print $1}'); do   
 if [[ "$i" != "lo" && "$i" != "sit0" ]];then                             

   echo -n `uname -n`", ";
   echo -n "\"`dmidecode -s system-manufacturer`\", ";
   echo -n $i", ";
   echo -n `ip addr show dev $i | grep "inet " | awk '{print $2}' | awk -F'/' '{print $1}'`", ";
   echo -n `cat /sys/class/net/$i/address`", ";
   echo -n `cat /sys/class/net/$i/operstate`", ";
   if [[ `ethtool -i $i | grep driver | awk -F': ' '{print $2}'` == "vif" ]]; then
     echo -n "Virtual, Set by host";
   elif [[ `ethtool -i $i | grep driver | awk -F': ' '{print $2}'` == "bonding" ]]; then
     echo -n "Bond, Set by slave";
   else
      ethtool $i | grep "Auto-negotiation" | awk -F ": " '{printf "%s ", $2","}';
          ethtool $i | grep "Speed" | awk -F ": " '{printf "%s ", $2}';
          ethtool $i | grep "Duplex" | awk -F ": " '{printf "%s ", $2" Duplex"}';
   fi
 fi
 echo "";
done
