#!/bin/bash 



# V-51391 - SV-65601r1_rule - A file integrity baseline must be created. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



aide_dir=$(sudo grep @@define /etc/aide.conf | grep DBDIR | awk '{print $NF}')

aide_db=$(sudo grep -E "^database( |=)" /etc/aide.conf | awk -F/ '{print $2}')

aide_db_path="$aide_dir$aide_db"



if [[ "$(sudo ls "$aide_dir")" =~ "$aide_db" ]]

then

	result="NotAFinding"

else

	result="Open"

fi



echo "V-51391 - SV-65601r1_rule - $result"