#!/bin/bash 



# V-38654 - SV-50455r2_rule - Remote file systems must be mounted with the nosuid option. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test455=$(sudo mount | grep nfs)



if test -z "$test455"

then

	result="NotAFinding"

else

	test455_2=$(echo "$test455" | grep nosuid)

	if test -z "$test455_2"

	then

		result="Open"

	else

		result="NotAFinding"

	fi

fi



echo " V-38654 - SV-50455r2_rule - $result"