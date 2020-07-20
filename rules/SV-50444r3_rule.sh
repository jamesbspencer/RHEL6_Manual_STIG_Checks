#!/bin/bash 



# V-38643 - SV-50444r3_rule - There must be no world-writable files on the system. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



for i in $(sudo df -lP -x tmpfs | tail -n +2 | awk '{print $NF}')

do

test444=$(sudo find $i -xdev -type f -perm -002)



if test -z "$test444"

then

	result="NotAFinding"

else

	result="Open"

	output="$test444"

	break

fi

done



echo "V-38643 - SV-50444r3_rule - $result - $output"