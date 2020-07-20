#!/bin/bash 



# V-38496 - SV-50297r3_rule - Default operating system accounts, other than root, must be locked. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



max_sys_id=$(sudo grep -i UID_MIN /etc/login.defs | awk '{print $2}' | xargs)

for u_id in $(sudo awk -F: '$3 < 500 && $3 > 0 {print $1}' /etc/passwd)

do



p_hash=$(sudo grep -E "^${u_id}\b" /etc/shadow | awk -F: '{print $2}')

if [ "$p_hash" == "*" ] || [ "$p_hash" == "!!" ]

then 

	result="NotAFinding"

else

	result="Open"

	break

fi



done



echo "V-38496 - SV-50297r3_rule - $result"