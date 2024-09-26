#!/bin/bash

name="Vardasr"
MyFavFood="PICA"

printf "My name is %s \n, and my favorite food is %s!" "$name" "$MyFavFood"



array=("$name" "$MyFavFood")
printf "Hi, may name is %s, and I like %s!"
printf "        %s\n" "${array[0]}"

printf "        %s\n" "${array[1]}"
 

