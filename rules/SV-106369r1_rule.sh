#!/bin/bash 



# V-97231 - SV-106369r1_rule - The SSH daemon must be configured to only use Message Authentication Codes (MACs) employing FIPS 140-2 approved cryptographic hash algorithms. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test369=$(sudo grep -i "mac" /etc/ssh/sshd_config |  grep -v '^#')



if test -z "$test369"

then

	result="Open"

elif test -n "$(echo "$test369" | sed -r 's/hmac-sha2-512//g;s/hmac-sha2-256//g;s/MACs//g;s/ //g')"

then

	result="Open"

else

	result="NotAFinding"

fi



echo "V-97231 - SV-106369r1_rule - $result"