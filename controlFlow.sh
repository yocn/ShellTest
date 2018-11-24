#!/bin/bash
flag=3
zero=0
flagTrue=false
# let flag=flag%2
echo $flagTrue
if [[ $flag == 0 ]]; then
  echo "12321"
else
  echo "3333333"
fi

for (( i = 0; i < 10; i++ )); do
  let flag=flag+1
  if [[ $flag%2 == 0 ]]; then
    printf "if -> %d \n" $flag
else
  printf "else -> %d \n" $flag
fi
done
