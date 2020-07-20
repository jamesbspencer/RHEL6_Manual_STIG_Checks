#!/bin/bash 



# V-38653 - SV-50454r2_rule - The snmpd service must not use a default password. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test454=$(sudo rpm -qa | grep -i snmp)

if test -z "$test454"

then

	result="Not_Applicable"

else

	test454_2=$(sudo grep -v "^#" /etc/snmp/snmpd.conf| grep public)

	if test -z "$test454_2"

	then

		result="NotAFinding"

	else

		result="Open"

	fi

fi



echo " V-38653 - SV-50454r2_rule - $result"