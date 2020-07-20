#!/bin/bash 

# V-38519 - SV-50320r2_rule - All rsyslog-generated log files must be group-owned by root. 
# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 

result='Not_Reviewed' 

for i in $(/usr/bin/sudo grep -v '^#' /etc/rsyslog.conf | grep -v '^$' | grep /var/log | awk '{print $2}' | grep '^/var/log')

do

owner=$(/usr/bin/sudo /usr/bin/stat -c %U $i)

if [ "$owner" == "root" ]

then

	result="NotAFinding"

else

	result="Open"

	finding="$i"

	break

fi

done

echo "V-38519 - SV-50320r2_rule - $result - $finding"