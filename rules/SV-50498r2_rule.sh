#!/bin/bash 



# V-38697 - SV-50498r2_rule - The sticky bit must be set on all public directories. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



for part in $(sudo df -Px tmpfs | tail -n +2 | awk '{print $1}')

do

test498=$(sudo find $part -xdev -type d -perm -002 \! -perm -1000)



	if test -z "$test498"

	then

		result="NotAFinding"

	else

		result="Open"

		break

	fi



done



echo "V-38697 - SV-50498r2_rule - $result"