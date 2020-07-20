#!/bin/bash 



# V-38468 - SV-50268r1_rule - The audit system must take appropriate action when the audit storage volume is full. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test268=$(sudo grep disk_full_action /etc/audit/auditd.conf | awk -F= '{print $2}' | xargs | grep -i -E "(ignore|syslog|exec|suspend|single|halt)")



if test -z "$test268"

then

	result="Open"

else

	result="NotAFinding"

fi



echo "V-38468 - SV-50268r1_rule - $result"