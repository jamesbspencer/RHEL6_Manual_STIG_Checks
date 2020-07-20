#!/bin/bash 



# V-38678 - SV-50479r2_rule - The audit system must provide a warning when allocated audit record storage volume reaches a documented percentage of maximum audit record storage capacity. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test479=$(sudo  grep -E "^space_left( |=)" /etc/audit/auditd.conf | awk -F= '{print $2}' | xargs)

left_kb=$(( test479 * 1024 ))

log_file=$(sudo grep -E "^log_file( |=)" /etc/audit/auditd.conf | awk -F= '{print $2}' | xargs)

part_size=$(sudo df -P $log_file | tail -n +2 | awk '{print $2}')





if [ "$left_kb" -ge "$part_size" ]

then

	result="Open"

else

	result="NotAFinding"

fi



echo " V-38678 - SV-50479r2_rule - $result"