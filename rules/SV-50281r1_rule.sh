#!/bin/bash 



# V-38481 - SV-50281r1_rule - System security patches and updates must be installed and up-to-date. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



if sudo yum update --assumeno | grep -q 'Total download size'

then

	result="Open"

else

	result="NotAFinding"

fi



echo "V-38481 - SV-50281r1_rule - $result"