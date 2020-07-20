#!/bin/bash 



# V-38460 - SV-50260r1_rule - The NFS server must not have the all_squash option enabled. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test260=$(grep all_squash /etc/exports)

if test -z "$test260"

then

	result="NotAFinding"

else

	result="Open"

	output=$test260

fi



echo "V-38460 - SV-50260r1_rule - $result - $output"