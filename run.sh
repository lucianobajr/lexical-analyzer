#!/bin/sh
printf "Running lex.l!\n"

printf "1.txt ... \n\n"

make main-first-test

printf "\n 2.txt ... \n\n"

make main-second-test

printf "3.txt ... \n\n"

make main-third-test

printf "\n 4.txt ... \n\n"

make main-fourth-test

printf "\n"

printf "Running lex-2.l!\n"

printf "1.txt ... \n\n"

make bank-first-test

printf "\n 2.txt ... \n\n"

make bank-second-test

printf "3.txt ... \n\n"

make bank-third-test

printf "\n 4.txt ... \n\n"

make bank-fourth-test

printf "\n"