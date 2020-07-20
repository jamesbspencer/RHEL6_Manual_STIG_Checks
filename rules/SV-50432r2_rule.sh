#!/bin/bash 



# V-38631 - SV-50432r2_rule - The operating system must employ automated mechanisms to facilitate the monitoring and control of remote access methods. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed'



test432=$(/usr/bin/sudo /sbin/service auditd status | grep pid)



if test -z "$test432"

then

	result="Open"

else

	result="NotAFinding"

fi



echo " V-38631 - SV-50432r2_rule - $result"