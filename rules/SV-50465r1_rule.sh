#!/bin/bash 



# V-38664 - SV-50465r1_rule - The system package management tool must verify ownership on all files and directories associated with the audit package. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test465=$(sudo rpm -V audit | grep '^.....U')

if test -z "$test465"

then

	result="NotAFinding"

else

	result="Open"

fi



echo " V-38664 - SV-50465r1_rule - $result"