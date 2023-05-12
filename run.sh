#!/bin/sh
printf "Running lex.l!\n"

printf "1.txt ... \n\n"

make test

printf "\n 2.txt ... \n\n"

make test-two

printf "\n"