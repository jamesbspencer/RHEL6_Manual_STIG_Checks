#!/bin/bash 



# V-81443 - SV-96157r1_rule - The Red Hat Enterprise Linux operating system must have an anti-virus solution installed. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test157=$(sudo rpm -qa | grep -i mfecma)

if test -n "$test157"

then

	test157_2=$(/usr/bin/sudo /sbin/service cma status | grep "McAfee agent" | grep running)

	

	if test -z "$test157_2"

	then

		result="Open"

	else

		result="NotAFinding"

	fi

fi



echo "V-81443 - SV-96157r1_rule - $result"