# net2csv
Print a subset of *nix network information in CSV format

Prints hostname, host type, and each network interface with IP, MAC, Status, Auto Negotiation On or Off, and Link Speed and Duplex

Designed for cross-system compatibility using lowest common tools (Redhat 5+, AIX 6+, Solaris 10/11).

example output:

<pre>
Host,Type,Interface,IP Address,MAC Address,Link Status,Auto Negotiation,Link Duplex & Speed
host01, Oracle Corporation, eth0, 10.0.0.200, 00:21:28:af:b2:12, up, on, 1000Mb/s Full Duplex
host01, Oracle Corporation, eth1, 10.0.0.201, 00:21:28:af:b2:13, up, on, 1000Mb/s Full Duplex
host01, Oracle Corporation, eth2, 10.0.0.202, 00:21:28:af:b2:13, up, on, 1000Mb/s Full Duplex
</pre>
