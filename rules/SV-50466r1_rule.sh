#!/bin/bash 



# V-38665 - SV-50466r1_rule - The system package management tool must verify group-ownership on all files and directories associated with the audit package. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test466=$(sudo rpm -V audit | grep '^......G')

if test -z "$test466"

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38665 - SV-50466r1_rule - $result"