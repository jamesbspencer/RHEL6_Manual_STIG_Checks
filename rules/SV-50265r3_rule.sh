#!/bin/bash 



# V-38465 - SV-50265r3_rule - Library files must have mode 0755 or less permissive. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



for i in /lib /lib64 /usr/lib /usr/lib64

do

if test -z $(sudo find -L $i -perm /022 -type f)

then

	result="NotAFinding"

else

	result="Open"

	break

fi

done



echo "V-38465 - SV-50265r3_rule - $result"