OBJFILES = $(patsubst %.c, %.o, src/lib/lex.l)
OBJFILES-TWO = $(patsubst %.c, %.o, src/lib/lex-2.l)
TARGET   = tp0


all: build
build: $(TARGET)

$(TARGET): $(OBJFILES)
	cd ./src/lib && \
	flex -o lex.yy.c lex.l && \
	gcc lex.yy.c -o ../../build/a.out

bank:
	cd ./src/lib && \
	flex -o lex-2.yy.c lex-2.l && \
	gcc lex-2.yy.c -o ../../build/a.out.2

main-first-test:
	./build/a.out < resources/main/1.txt

main-second-test:
	./build/a.out < resources/main/2.txt

bank-first-test:
	./build/a.out.2 < resources/others/1.txt

bank-second-test:
	./build/a.out.2 < resources/others/2.txt