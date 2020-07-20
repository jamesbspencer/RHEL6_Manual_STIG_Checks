#!/bin/bash 



# V-38695 - SV-50496r2_rule - A file integrity tool must be used at least weekly to check for unauthorized file changes, particularly the addition of unauthorized system libraries or binaries, or for unauthorized modification to authorized system libraries or binaries. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test496=$(sudo grep aide /etc/crontab /etc/cron.*/* | grep -v '^#')



if test -z "$test496"

then

        result="Open"

else

        result="NotAFinding"

fi



echo " V-38695 - SV-50496r2_rule - $result"