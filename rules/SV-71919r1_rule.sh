#!/bin/bash 



# V-57569 - SV-71919r1_rule - The noexec option must be added to the /tmp partition. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test919=$(sudo grep '\s/tmp' /etc/fstab | grep noexec)



if test -z "$test919"

then

	result="Open"

else

	result="NotAFinding"

fi



echo " V-57569 - SV-71919r1_rule - $result"