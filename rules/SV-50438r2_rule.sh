#!/bin/bash 



# V-38637 - SV-50438r2_rule - The system package management tool must verify contents of all files associated with the audit package. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test438=$(sudo rpm -V audit | awk '$1 ~ /..5/ && $2 != "c"')



if test -z "$test438"

then

	result="NotAFinding"

else

	result="Open"

fi



echo " V-38637 - SV-50438r2_rule - $result"