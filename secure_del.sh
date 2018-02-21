#!/bin/bash

# Deletes a file securely by writing /dev/random to the file before removing the reference to the file

file=$1
size=$(ls -l $file | awk '{print $5}')
dd if=/dev/random of=$file bs=$size count=1
rm -f $file
