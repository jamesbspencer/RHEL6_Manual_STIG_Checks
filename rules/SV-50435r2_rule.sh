#!/bin/bash 



# V-38634 - SV-50435r2_rule - The system must rotate audit log files that reach the maximum file size. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed'



test435=$(sudo grep max_log_file_action /etc/audit/auditd.conf | awk -F= '{print $2}' | xargs | grep -i -E '(ignore|rotate|keep_logs|ignore|syslog|suspend)')



if test -z "$test435"

then

	result="Open"

else

	result="NotAFinding"

fi



echo " V-38634 - SV-50435r2_rule - $result"