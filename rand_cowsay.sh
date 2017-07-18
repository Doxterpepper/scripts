#! /bin/bash
cow_path=/usr/local/Cellar/cowsay/3.04/share/cows/*.cow
files=($(ls $cow_path))
num=$[ 1 + $[RANDOM % 10 ]]
cow=${files[$num]}
fortune | cowsay -f $cow | lolcat
