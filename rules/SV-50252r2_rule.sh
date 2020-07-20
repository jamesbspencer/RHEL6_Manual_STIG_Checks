#!/bin/bash 



# V-38452 - SV-50252r2_rule - The system package management tool must verify permissions on all files and directories associated with packages. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed'



test252=$(/usr/bin/sudo /bin/rpm -Va | grep '^.M' | /bin/awk '{print $NF}')

if test -z "$test252"

then

	result="NotAFinding"

else

	for i in $test252

	do

		app=$(/usr/bin/sudo /bin/rpm -qf $i)

		operms=$(/usr/bin/sudo /bin/rpm -q --queryformat "[%{FILENAMES} %{FILEMODES:octal}\n]" $app | grep $i | tail -c4)

		cperms=$(/usr/bin/sudo /usr/bin/stat -c '%a' $i)

		if [ "$cperms" -gt "$operms" ]

		then

			result="Open"

			finding=$i

			break

		fi

	done

fi

echo "V-38452 - SV-50252r2_rule - $result - $finding"