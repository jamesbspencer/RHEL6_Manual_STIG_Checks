#!/bin/bash 



# V-38596 - SV-50397r3_rule - The system must implement virtual address space randomization. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test397=$(/usr/bin/sudo /sbin/sysctl kernel.randomize_va_space | awk -F= '{print $2}' | xargs)



if [ "$test397" == "2" ]

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38596 - SV-50397r3_rule - $result"