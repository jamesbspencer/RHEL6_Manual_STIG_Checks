#!/bin/bash 



# V-38696 - SV-50497r2_rule - The operating system must employ automated mechanisms, per organization defined frequency, to detect the addition of unauthorized components/devices into the operating system. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test497=$(sudo grep aide /etc/crontab /etc/cron.*/* | grep -v '^#')



if test -z "$test497"

then

        result="Open"

else

        result="NotAFinding"

fi



echo " V-38696 - SV-50497r2_rule - $result"