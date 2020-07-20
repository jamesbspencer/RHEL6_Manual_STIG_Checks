#!/bin/bash 



# V-38599 - SV-50400r3_rule - The FTPS/FTP service on the system must be configured with the Department of Defense (DoD) login banner. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



if test -z "$(sudo rpm -qa | grep vsftpd)"

then

	result="Not_Applicable"

else

	test400=$(sudo grep "banner_file" /etc/vsftpd/vsftpd.conf | awk -F= '{print $2}' | xargs)

	if [ "$test400" == "/etc/issue" ]

	then

		result="NotAFinding"

	else

		result="Open"

	fi

fi



echo "V-38599 - SV-50400r3_rule - $result"