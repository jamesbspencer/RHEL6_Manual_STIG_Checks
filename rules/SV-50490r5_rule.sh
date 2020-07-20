#!/bin/bash 

# V-38689 - SV-50490r5_rule - The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts. 
# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 

result='Not_Reviewed' 

test490=$(sudo rpm -qa | grep -i gconf2)

if test -z "$test490"

then
	result="Not_Applicable"
else
	test490_2=$(sudo gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --get /apps/gdm/simple-greeter/banner_message_text | grep -i "you are accessing a u.s. government")
	if test -z "$test490_2"
	then
		result="Open"
	else
		result="NotAFinding"
	fi
fi

echo "V-38689 - SV-50490r5_rule - $result"