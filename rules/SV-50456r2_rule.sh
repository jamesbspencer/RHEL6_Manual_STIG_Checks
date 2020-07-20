#!/bin/bash 



# V-38655 - SV-50456r2_rule - The noexec option must be added to removable media partitions. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test456=$(sudo grep media /etc/fstab)

if test -z "$test456"

then

	result="NotAFinding"

else

	test456_2=$(echo "$test456" | grep noexec)

	if test -z "$test456_2"

	then

		result="Open"

	else

		result="NotAFinding"

	fi

fi



echo " V-38655 - SV-50456r2_rule - $result"