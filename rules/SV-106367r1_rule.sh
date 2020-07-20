#!/bin/bash 



# V-97229 - SV-106367r1_rule - The Red Hat Enterprise Linux operating system must implement NIST FIPS-validated cryptography for the following: to provision digital signatures, to generate cryptographic hashes, and to protect data requiring data-at-rest protections in accordance with applicable federal laws, Executive Orders, directives, policies, regulations, and standards. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



fips1=$(sudo rpm -qa | grep -i dracut-fips)

fips2=$(sudo grep -h -s -i fips /boot/grub/grub.conf /boot/efi/EFI/redhat/grub.conf | grep $'^\tkernel')

fips3=$(sudo cat /proc/sys/crypto/fips_enabled) 



if test -z "$fips1"

then

	result="Open"

elif test -z "$fips2"

then

	result="Open"

elif [ "$fips3" -ne 1 ]

then

	result="Open"

else

	result="NotAFinding"

fi



echo "V-97229 - SV-106367r1_rule - $result"