#!/bin/bash 



# V-38520 - SV-50321r1_rule - The operating system must back up audit records on an organization defined frequency onto a different system or media than the system being audited. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test321=$(sudo grep '^\*\.\*' /etc/rsyslog.conf | awk '{print $2}' | xargs)



if [[ "$test321" =~ ^"@" ]]

then

	result="NotAFinding"

else

	result="Open"

	output="$test321"

fi



echo " V-38520 - SV-50321r1_rule - $result $output"