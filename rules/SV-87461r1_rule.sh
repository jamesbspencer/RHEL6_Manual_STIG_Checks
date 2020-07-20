#!/bin/bash 



# V-72817 - SV-87461r1_rule - Wireless network adapters must be disabled. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test461=$(/usr/bin/sudo /sbin/lspci | grep -i 'ethernet\|network' | grep -i wi)



if test -z "$test461"

then

	result="Not_Applicable"
	finding="System does not have wireless adapters"

else

	test461_2=$(/usr/bin/sudo /sbin/ip link | grep -i wl)

	if test -z "$test461_2"

	then

		result="NotAFinding"

	else

		result="Open"

	fi

fi



echo "V-72817 - SV-87461r1_rule - $result - $finding"