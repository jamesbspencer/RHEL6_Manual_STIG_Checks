#!/bin/bash 



# V-38444 - SV-50244r2_rule - The systems local IPv6 firewall must implement a deny-all, allow-by-exception policy for inbound packets. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed'



ipv6=$(sudo grep net.ipv6.conf.all.disable_ipv6 /etc/sysctl.conf | awk -F= '{print $2}' | xargs)

if [ "$ipv6" = "1" ]

then 

	result="Not_Applicable" 

else

	if [ "$(grep ":INPUT" /etc/sysconfig/ip6tables | awk '{print $2}')" = "DROP" ]

	then

		result="NotAFinding"

	else

		result="Open"

	fi

fi



echo "V-38444 - SV-50244r2_rule - $result"