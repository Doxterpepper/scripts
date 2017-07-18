#! /bin/bash
if [ $OSTYPE == "darwin16" ]
then
  cow_path=/usr/local/Cellar/cowsay/3.04/share/cows/*.cow
fi
#cow_path=/usr/local/Cellar/cowsay/3.04/share/cows/*.cow
files=($(ls $cow_path))
num=$[ 1 + $[RANDOM % 10 ]]
cow=${files[$num]}
fortune | cowsay -f $cow | lolcat
