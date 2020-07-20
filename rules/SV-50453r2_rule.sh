#!/bin/bash 



# V-38652 - SV-50453r2_rule - Remote file systems must be mounted with the nodev option. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test453=$(sudo mount | grep "nfs")



if test -z "$test453"

then

	result="NotAFinding"

else

	test453_2=$(echo "$test453" | grep "nodev")

	if test -z "$test453_2"

	then

		result="Open"

	else

		result="NotAFinding"

	fi

fi



echo "V-38652 - SV-50453r2_rule - $result"