#!/bin/bash 



# V-38597 - SV-50398r3_rule - The system must limit the ability of processes to have simultaneous write and execute access to memory. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test398=$(/usr/bin/sudo /sbin/sysctl kernel.exec-shield | awk -F= '{print $2}' | xargs)



if [ "$test398" == "1" ]

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38597 - SV-50398r3_rule - $result"