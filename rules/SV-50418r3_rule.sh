#!/bin/bash 



# V-38617 - SV-50418r3_rule - The SSH daemon must be configured to use only FIPS 140-2 approved ciphers. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test418=$(sudo grep -i '^Ciphers' /etc/ssh/sshd_config | sed -e 's/aes128-ctr//g;s/aes192-ctr//g;s/aes256-ctr//g;s/aes128-cbc//g;s/aes192-cbc//g;s/aes-256-cbc//g;s/3des-cbc//g;s/,//g;s/ //g;s/Ciphers//g;s/ciphers//g')



if test -z "$test418"

then

	result="NotAFinding"

else

	result="open"

fi



echo "V-38617 - SV-50418r3_rule - $result"