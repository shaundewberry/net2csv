#!/usr/bin/ksh
#echo "Host,Interface,IP Address,MAC Address,Link Status,Link Duplex & Speed,Autonegotiation"

for i in $(dladm show-linkprop -p zone | grep -v LINK | uniq | awk '{print $1}'); do
   if [[ $i != "lo0" ]];then
    print `uname -n`", "$i", \c";
        print `netstat -n -I $i -f inet | tail +2 | grep . | awk '{print $4}'`", \c";
        #print `ifconfig $i | grep ether | awk '{print $2}'`", \c";
        IP=`netstat -n -I $i -f inet | tail +2 | grep . | awk '{print $4}'`;
        print `netstat -pn | grep " $IP" | head -1 | awk '{print $5}'`", \c";

        case `uname -r` in
          "5.10")
                  dladm show-dev $i | awk '{printf "%s", $3", "$5" "$6", "$8" Duplex, " }';
                  ;;
          "5.11") #dladm show-phys $i -m | grep -v LINK | awk '{printf "%s", $3", "}'
                  dladm show-phys $i | tail +2 | awk '{printf "%s", $3", "$5" Mbps, "$5" Duplex" }';
                  ;;
          *)
        esac
        print `kstat -p :::adv_cap_autoneg | sed 's/://g' | grep $i"mac" | awk '{print $2}'`;
   fi
 done
