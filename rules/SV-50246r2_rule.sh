#!/bin/bash 



# V-38446 - SV-50246r2_rule - The mail system must forward all mail for root to one or more system administrators. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



if [[ $(/usr/bin/sudo /usr/sbin/postconf alias_maps | awk -F= '{print $2}' | xargs /usr/bin/sudo /usr/sbin/postmap -q root) =~ "@" ]]

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38446 - SV-50246r2_rule - $result"