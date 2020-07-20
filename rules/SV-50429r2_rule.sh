#!/bin/bash 

# V-38628 - SV-50429r2_rule - The operating system must produce audit records containing sufficient information to establish the identity of any user/subject associated with the event. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 

result='Not_Reviewed' 

test429=$(/usr/bin/sudo /sbin/service auditd status | grep -i pid)

if test -z "$test429"
then
	result="Open"
else
	result="NotAFinding"

echo "V-38628 - SV-50429r2_rule - $result"