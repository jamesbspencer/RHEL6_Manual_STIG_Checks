#!/bin/bash 



# V-38454 - SV-50254r2_rule - The system package management tool must verify ownership on all files and directories associated with packages. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test254=$(rpm -Va | grep '^.....U')

if test -z "$test254"

then

	result="NotAFinding"

else

	result="Open"

	output=$test254

fi



echo "V-38454 - SV-50254r2_rule - $result - $output"