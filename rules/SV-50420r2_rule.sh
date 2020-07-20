#!/bin/bash 



# V-38619 - SV-50420r2_rule - There must be no .netrc files on the system. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test420=$(sudo find /root /home -xdev -name .netrc)



if test -z "$test420"

then

	result="NotAFinding"

else

	result="Open"

fi



echo " V-38619 - SV-50420r2_rule - $result"