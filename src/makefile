
out:scanner

scanner:lex.yy.c token.h
	gcc -Wall -o $@ $<

lex.yy.c: scanner.l
	flex $<

clean:
	rm -rf ./scanner ./lex.yy.c
