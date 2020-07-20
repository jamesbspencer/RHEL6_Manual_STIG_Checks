#!/bin/bash 



# V-38667 - SV-50468r3_rule - The system must have a host-based intrusion detection tool installed. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test468=$(/usr/bin/sudo /bin/rpm -qa | grep -i MFEhip1sm)

test468_2=$(/usr/bin/sudo /usr/sbin/getenforce | grep -i enforcing)

 

if test -z "$test468" && test -z "$test468_2"

then

	result="Open"

else

	result="NotAFinding"

fi



echo "V-38667 - SV-50468r3_rule - $result"