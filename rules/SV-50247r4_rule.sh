#!/bin/bash 



# V-38447 - SV-50247r4_rule - The system package management tool must verify contents of all files associated with packages. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test=$(sudo rpm -Va | awk '$1 ~ /..5/ && $2 != "c" && $NF !~ /\.cer$|\.xml$|\.archive$|\.config$/ {print $NF}')

if test -z "$test" 

 then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-38447 - SV-50247r4_rule - $result"