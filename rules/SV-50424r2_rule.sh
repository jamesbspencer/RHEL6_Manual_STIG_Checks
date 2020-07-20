#!/bin/bash 

# V-38623 - SV-50424r2_rule - All rsyslog-generated log files must have mode 0600 or less permissive. 
# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 


result='Not_Reviewed' 

for i in $(sudo grep -v -e '^#' /etc/rsyslog.conf | grep -v '^$' | grep /var/log | awk '{print $2}' | grep '^/var/log')

do

perms=$(sudo stat -c %a $i)

if [ "$perms" -le 600 ]

then

	result="NotAFinding"

else

	result="Open"

	output="$i"

	break

fi

done


echo "V-38623 - SV-50424r2_rule - $result - $output"