#!/bin/bash 



# V-38493 - SV-50294r1_rule - Audit log directories must have mode 0755 or less permissive. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



for i in $(sudo grep "^log_file" /etc/audit/auditd.conf|sed 's/^[^/]*//; s/[^/]*$//'|xargs stat -c %a)

do

if [ "$i" -gt "755" ]

then

	result="Open"

	break

else

	result="NotAFinding"

fi	

done



echo "V-38493 - SV-50294r1_rule - $result"