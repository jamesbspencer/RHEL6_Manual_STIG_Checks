#!/bin/bash 



# V-38681 - SV-50482r2_rule - All GIDs referenced in /etc/passwd must be defined in /etc/group 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test482=$(/usr/bin/sudo /usr/sbin/pwck -r | grep 'no group')



if test -z "$test482"

then

	result="NotAFinding"

else

	result="Open"

fi



echo " V-38681 - SV-50482r2_rule - $result"