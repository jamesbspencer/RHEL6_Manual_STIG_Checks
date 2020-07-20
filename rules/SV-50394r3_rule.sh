#!/bin/bash 



# V-38593 - SV-50394r3_rule - The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, console login prompts. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



if sudo grep -q -i "you are accessing a u.s. government" /etc/issue

then

	result="NotAFinding"

else

	result="Open"

fi

echo "V-38593 - SV-50394r3_rule - $result"