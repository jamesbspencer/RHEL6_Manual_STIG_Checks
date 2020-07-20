#!/bin/bash 



# V-38682 - SV-50483r6_rule - The Bluetooth kernel module must be disabled. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test483=$(sudo grep -sh bluetooth /etc/modprobe.conf /etc/modprobe.d/* | grep -i "/bin/true"| grep -v "^#")



if test -z "$test483"

then

	result="Open"

else

	result="NotAFinding"

fi



echo "V-38682 - SV-50483r6_rule - $result"