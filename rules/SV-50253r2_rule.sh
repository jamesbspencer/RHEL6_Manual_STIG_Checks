#!/bin/bash 



# V-38453 - SV-50253r2_rule - The system package management tool must verify group-ownership on all files and directories associated with packages. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test253=$(rpm -Va | grep '^......G')

if test -z "$test253"

then

	result="NotAFinding"

else

	result="Open"

fi



echo " V-38453 - SV-50253r2_rule - $result"