#!/bin/bash 



# V-51379 - SV-65589r1_rule - All device files must be monitored by the system Linux Security Module. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test589=$(sudo ls -RZ /dev | grep unlabeled_t)

if test -z "$test589"

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-51379 - SV-65589r1_rule - $result"