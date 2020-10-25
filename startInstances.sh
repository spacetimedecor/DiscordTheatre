#!/bin/bash
rm -r ./test*;
#first, kill all applications called Chromium:
killall Chromium;
#rm ./pIDs.txt;
#pIDs=();
#exec 3<> pIDs.txt
for ((i=1; i <= $1; i++)); do
  mkdir "test$i";
  open /Applications/Chromiums/Chromium.app -n --args --user-data-dir="/Applications/Chromiums/test$i" &
#  pIDs+=($!);
#  echo $! >&3
done;
#exec 3>&-
#for i in "${!pIDs[@]}"; do
#  printf "%s\t%s\n" "$i" "${pIDs[$i]}"
#done
node /Applications/Chromiums/controlInstances.js "$1"
#ls;