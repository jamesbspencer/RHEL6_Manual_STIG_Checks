#!/bin/bash 



# V-38683 - SV-50484r1_rule - All accounts on the system must have unique user or account names 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test484=$(/usr/bin/sudo /usr/sbin/pwck -rq)



if test -z "$test484"

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38683 - SV-50484r1_rule - $result"