#!/bin/bash 



# V-38663 - SV-50464r1_rule - The system package management tool must verify permissions on all files and directories associated with the audit package. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test464=$(sudo rpm -V audit | grep '^.M')

if test -z "$test464"

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38663 - SV-50464r1_rule - $result"