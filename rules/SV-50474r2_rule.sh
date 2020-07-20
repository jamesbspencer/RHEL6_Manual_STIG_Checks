#!/bin/bash 



# V-38673 - SV-50474r2_rule - The operating system must ensure unauthorized, security-relevant configuration changes detected are tracked. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test471=$(sudo grep aide /etc/crontab /etc/cron.*/* | grep -v '^#')



if test -z "$test471"

then

        result="Open"

else

        result="NotAFinding"

fi



echo " V-38673 - SV-50474r2_rule - $result"