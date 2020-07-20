#!/bin/bash 



# V-38560 - SV-50361r2_rule - The operating system must connect to external networks or information systems only through managed IPv4 interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



if test -z "$(/usr/bin/sudo /sbin/service iptables status | grep not)"

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38560 - SV-50361r2_rule - $result"