#!/bin/bash 



# V-38464 - SV-50264r1_rule - The audit system must take appropriate action when there are disk errors on the audit storage volume. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed'



test264=$(sudo grep disk_error_action /etc/audit/auditd.conf | awk -F= '{print $2}' | xargs | grep -i -E "(syslog|ignore|exec|suspend|single|halt)")

if test -z "$test264"

then

	result="Open"

	output=$(sudo grep disk_error_action /etc/audit/auditd.conf)

else

	result="NotAFinding"

fi



echo " V-38464 - SV-50264r1_rule - $result - $output"