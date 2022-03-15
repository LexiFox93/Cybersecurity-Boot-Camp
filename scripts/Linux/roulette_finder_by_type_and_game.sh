#! /bin/bash
grep "$1" $2 "$3"
if ["$3"=="BlackJack"]; then
 awk -F '{print ($1, $2, $3, $4)}'
elif ["$3"=="Roulette"]; then
 awk -F '{print ($1, $2, $5, $6)}'
else
 awk -F '{print ($1, $2, $7, $8)}'
fi
