#!/bin/bash 



# V-58901 - SV-73331r2_rule - The sudo command must require authentication. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test331_1=$(sudo egrep -s '^[^#]*NOPASSWD' /etc/sudoers /etc/sudoers.d/*)

test331_2=$(sudo egrep -s '^[^#]*!authenticate' /etc/sudoers /etc/sudoers.d/*)



if test -n "$test331_1" || test -n "$test331_2"

then

	result="Open"

else

	result="NotAFinding"

fi



echo " V-58901 - SV-73331r2_rule - $result"