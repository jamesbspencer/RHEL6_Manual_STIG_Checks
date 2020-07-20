#!/bin/bash 



# V-38471 - SV-50271r1_rule - The system must forward audit records to the syslog service. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test271=$(sudo grep active /etc/audisp/plugins.d/syslog.conf | awk -F= '{print $2}' | xargs)



if echo $test271 | grep -q -i yes

then

	result="NotAFinding"

else

	result="Open"

        output=$test271

fi



echo " V-38471 - SV-50271r1_rule - $result - $output"