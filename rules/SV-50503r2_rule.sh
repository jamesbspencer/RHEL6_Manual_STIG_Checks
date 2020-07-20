#!/bin/bash 

# V-38702 - SV-50503r2_rule - The FTP daemon must be configured for logging or verbose mode. 
# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 

result='Not_Reviewed' 

test503=$(sudo rpm -qa | grep -i vsftpd)

if test -z "$test503"

then

	result="Not_Applicable"
	finding="VSFTPd is not installed"
else

	test503_2=$(sudo find / -name  "vsftpd.log" -exec grep '^server_args' {} \;)

	if test -z "$tes503_2"

	then

		result="Open"

	else

		result="NotAFinding"

	fi

fi



echo " V-38702 - SV-50503r2_rule - $result - $finding"