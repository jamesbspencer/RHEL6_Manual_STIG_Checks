#!/bin/bash 



# V-38609 - SV-50410r3_rule - The TFTP service must not be running. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test410=$(sudo chkconfig "tftp" --list 2>/dev/null)



if test -z "$test410" || echo "$test410" | grep -v on

then

	result="NotAFinding"

else

	result="Open"

fi



echo " V-38609 - SV-50410r3_rule - $result"