#!/bin/bash 



# V-38478 - SV-50278r2_rule - The Red Hat Network Service (rhnsd) service must not be running, unless using RHN or an RHN Satellite. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test1=$(/usr/bin/sudo /sbin/chkconfig "rhnsd" --list | grep -v '^error' | grep :on)

test2=$(/usr/bin/sudo /sbin/service rhnsd status | grep running)



if test -z "$test1" && test -z "$test2"

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38478 - SV-50278r2_rule - $result"