#!/bin/bash 



# V-38686 - SV-50487r2_rule - The systems local firewall must implement a deny-all, allow-by-exception policy for forwarded packets. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test487=$(/usr/bin/sudo /sbin/iptables -nvL | grep -i forward | grep -i drop)



if test -z "$test487"

then

	result="Open"

else

	result="NotAFinding"

fi



echo "V-38686 - SV-50487r2_rule - $result"