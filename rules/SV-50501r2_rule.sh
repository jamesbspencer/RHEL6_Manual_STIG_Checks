#!/bin/bash 



# V-38700 - SV-50501r2_rule - The operating system must provide a near real-time alert when any of the organization defined list of compromise or potential compromise indicators occurs.  

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test501=$(sudo grep aide /etc/crontab /etc/cron.*/* | grep -v '^#')



if test -z "$test501"

then

        result="Open"

else

        result="NotAFinding"

fi



echo " V-38700 - SV-50501r2_rule - $result"