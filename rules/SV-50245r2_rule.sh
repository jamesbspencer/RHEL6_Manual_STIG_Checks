#!/bin/bash 



# V-38445 - SV-50245r2_rule - Audit log files must be group-owned by root. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



if [ $(sudo grep "^log_file" /etc/audit/auditd.conf | sed s/^[^\/]*// | xargs sudo stat -c %G) = "root" ]

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38445 - SV-50245r2_rule - $result"