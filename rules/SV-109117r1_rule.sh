#!/bin/bash 



# V-100013 - SV-109117r1_rule - The Red Hat Enterprise Linux operating system must be configured so that the SSH daemon is configured to only use Message Authentication Codes (MACs) employing FIPS 140-2 approved cryptographic hash algorithms. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test117=$(sudo grep -i "mac" /etc/ssh/sshd_config |  grep -v '^#')



if test -z "$test117"

then

        result="Open"

elif test -n "$(echo "$test117" | sed -r 's/hmac-sha2-512//g;s/hmac-sha2-256//g;s/MACs//g;s/ //g')"

then

        result="Open"

else

        result="NotAFinding"

fi



echo "V-100013 - SV-109117r1_rule - $result"