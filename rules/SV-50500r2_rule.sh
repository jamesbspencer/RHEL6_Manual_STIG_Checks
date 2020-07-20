#!/bin/bash 



# V-38699 - SV-50500r2_rule - All public directories must be owned by a system account. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



for part in $(sudo df -Px tmpfs | tail -n +2 | awk '{print $1}')

do

test500=$(sudo find $part -xdev -type d -perm -0002 -uid +499 -print)

if test -z "$test500"

then

	result="NotAFinding"

else

	result="Open"

fi



done



echo " V-38699 - SV-50500r2_rule - $result"