#!/bin/bash 



# V-38513 - SV-50314r2_rule - The systems local IPv4 firewall must implement a deny-all, allow-by-exception policy for inbound packets. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test314=$(/usr/bin/sudo /sbin/iptables -nvL | grep -i input | head -1)

if [[ "$test314" =~ "DROP" ]]

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38513 - SV-50314r2_rule - $result"