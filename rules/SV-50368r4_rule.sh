#!/bin/bash 



# V-38567 - SV-50368r4_rule - The audit system must be configured to audit all use of setuid and setgid programs. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



for i in $(sudo df -Pl -x tmpfs | tail -n +2 | awk '{print $NF}')

do

	for j in $(sudo find $i -xdev -type f -perm /6000 2>/dev/null)

	do

		if sudo grep -q $j /etc/audit/audit.rules

		then

			result="NotAFinding"

		else

			result="Open"

			break

		fi

	done

done



echo " V-38567 - SV-50368r4_rule - $result"