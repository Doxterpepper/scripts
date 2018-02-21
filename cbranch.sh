#!/bin/bash

git status | grep 'On branch' | awk '{print $3}'
