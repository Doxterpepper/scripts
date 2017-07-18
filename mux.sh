#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Too few arguments"
else
  tmux attach -t $1
  if [ $? -ne 0 ]
  then
    tmux new -s $1
  fi 
fi

