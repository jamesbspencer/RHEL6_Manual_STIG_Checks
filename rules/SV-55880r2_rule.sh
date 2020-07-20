#!/bin/bash 



# V-43150 - SV-55880r2_rule - The login user list must be disabled. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test880=$(sudo rpm -qa | grep -i '^gconf2')

if test -z "$test880"

then

	result="Not_Applicable"

else

	test880_2=$(sudo gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --get /apps/gdm/simple-greeter/disable_user_list)

	if [ "$test880_2" == "true" ]

	then

		result="NotAFinding"

	else

		result="Open"

	fi

fi



echo "V-43150 - SV-55880r2_rule - $result"