#!/bin/bash 



# V-38657 - SV-50458r2_rule - The system must use SMB client signing for connecting to samba servers using mount.cifs. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test458=$(sudo rpm -qa | grep -i samba)

if test -z "$test458"

then

	result="Not_Applicable"
	finding="Samba is not in use"

else

	test458_2=$(sudo grep sec /etc/fstab /etc/mtab | awk -F= '{print $2}' | xargs | grep -i -E '(krb5i|ntlmv2i)')

	if test -z "$test458_2"

	then

		result="Open"

	else

		result="NotAFinding"

	fi

fi



echo "V-38657 - SV-50458r2_rule - $result - $finding"