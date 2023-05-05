all:
	flex lex.l
main:
	gcc lex.yy.c
run:
	./a.out < ./data/1.txt