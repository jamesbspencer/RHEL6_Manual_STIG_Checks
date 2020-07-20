#!/bin/bash 



# V-38466 - SV-50266r4_rule - Library files must be owned by a system account. 

# Valid results are Open, NotAFinding, Not_Applicable, and Not_Reviewed 



result='Not_Reviewed' 



for i in /lib /lib64 /usr/lib /usr/lib64

do

check1=$(sudo find -L $i \! -user root)

if test -z "$check1"

then

  result="NotAFinding"

else

  for j in $check1

  do

    echo "processing j $j"

    test266=$(sudo rpm -V -f $j | grep '^.....U')

    if test -z "$test266"

    then

      result="NotAFinding"

    else

      result="Open"

      break

    fi

  done

fi

done



echo "V-38466 - SV-50266r4_rule - $result"