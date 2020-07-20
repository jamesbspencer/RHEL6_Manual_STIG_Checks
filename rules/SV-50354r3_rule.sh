#!/bin/bash 



# V-38553 - SV-50354r3_rule - The operating system must prevent public IPv6 access into an organizations internal networks, except as appropriately mediated by managed interfaces employing boundary protection devices. 

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



echo "V-38553 - SV-50354r3_rule - $result - $finding"