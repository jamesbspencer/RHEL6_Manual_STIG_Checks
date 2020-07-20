#!/bin/bash 



# V-38660 - SV-50461r2_rule - The snmpd service must use only SNMP protocol version 3 or newer. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test461=$(sudo rpm -qa | grep -i snmp)

if test -z "$test461"

then

	result="Not_Applicable"

else

	test461_2=$(sudo grep 'v1\|v2c\|com2sec' /etc/snmp/snmpd.conf | grep -v '^#')

	if test -z "$test461_2"

	then

		result="NotAFinding"

	else

		result="Open"

	fi

fi



echo "V-38660 - SV-50461r2_rule - $result"