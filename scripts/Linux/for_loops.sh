#!/bin/bash

#create variables
mystates=('OHIO' 'Arizona' 'Louisiana' 'Florida' 'Pennsylvania')
nums=$(echo {0..9})
ls_out=$(ls)

execs=$(find /home -type f -perm 777 2>/dev/null)

#create for loop that looks for state of Hawaii
for mystate in ${mystates[@]}; do
   if [ $mystate == 'Hawaii' ]; then
      echo "Hawaii is the best!"
   else
      echo "I'm not fond of Hawaii."
   fi
done

#for loop that prints out 3, 5 & 7
