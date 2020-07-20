#!/bin/bash 



# V-100011 - SV-109115r1_rule - The Red Hat Enterprise Linux operating system must not contain .shosts or shosts.equiv files. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test115_1=$(sudo find / -name '*.shosts')

test115_2=$(sudo find / -name shosts.equiv)



if test -z "$test115_1"  && test -z "$test115_2"

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-100011 - SV-109115r1_rule - $result"