#!/bin/bash 



# V-38484 - SV-50285r2_rule - The operating system, upon successful logon, must display to the user the date and time of the last logon or access via ssh. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test385=$(sudo grep -i "^PrintLastLog" /etc/ssh/sshd_config)

if test -z "$test385"

then

	result="NotAFinding"

else

	test385_2=$(echo $test385 | grep -i yes)

	if test -z "$test385"

	then

		result="Open"

	else

		result="NotAFinding"

	fi

fi



echo "V-38484 - SV-50285r2_rule - $result"