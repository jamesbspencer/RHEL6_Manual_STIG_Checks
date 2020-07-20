#!/bin/bash 



# V-38474 - SV-50274r2_rule - The system must allow locking of graphical desktop sessions. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



test274=$(sudo rpm -qa | grep -i gconf2)

if test -z "$test274"

then

	result="Not_Applicable"

else

	test274_2=$(/usr/bin/sudo /usr/bin/gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --get /apps/gnome_settings_daemon/keybindings/screensaver)

	if test -z "$test274_2" 

	then

		result="Open"

	else

		result="NotAFinding"

	fi

fi



echo "V-38474 - SV-50274r2_rule - $result"