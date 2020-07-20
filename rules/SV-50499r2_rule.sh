#!/bin/bash 



# V-38698 - SV-50499r2_rule - The operating system must employ automated mechanisms to detect the presence of unauthorized software on organizational information systems and notify designated organizational officials in accordance with the organization defined frequency. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test499=$(sudo grep aide /etc/crontab /etc/cron.*/* | grep -v '^#')



if test -z "$test499"

then

        result="Open"

else

        result="NotAFinding"

fi



echo " V-38698 - SV-50499r2_rule - $result"