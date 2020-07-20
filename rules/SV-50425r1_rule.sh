#!/bin/bash 



# V-38624 - SV-50425r1_rule - System logs must be rotated daily. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



today=$(date +%s)

test425=$(date -d "$(sudo grep -h logrotate /var/log/cron* | sort  -k1M -k2n | tail -n 1 | awk '{print $1" "$2}')" +%s)

since_last=$(( $today - $test425 ))



if [ "$since_last" -lt 86400 ]

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38624 - SV-50425r1_rule - $result"