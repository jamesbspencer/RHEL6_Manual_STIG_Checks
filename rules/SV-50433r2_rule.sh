#!/bin/bash 



# V-38632 - SV-50433r2_rule - The operating system must produce audit records containing sufficient information to establish what type of events occurred. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test432=$(/usr/bin/sudo /sbin/service auditd status | grep pid)



if test -z "$test432"

then

        result="Open"

else

        result="NotAFinding"

fi



echo " V-38632 - SV-50433r2_rule - $result"