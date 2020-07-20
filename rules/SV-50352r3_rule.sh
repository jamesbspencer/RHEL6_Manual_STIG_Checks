#!/bin/bash 



# V-38551 - SV-50352r3_rule - The operating system must connect to external networks or information systems only through managed IPv6 interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test350=$(sudo grep net.ipv6.conf.all.disable.ipv6 /etc/sysctl.conf | awk -F= '{print $2}' | xargs)

if [ "$test350" == "1" ]

then

        result="Not_Applicable"
		finding="IPv6 is disabled"

else

        if sudo service ip6tables status | grep -q not

        then

                result="Open"

        else

                result="NotAFinding"

        fi



fi



echo "V-38551 - SV-50352r3_rule - $result - $finding"