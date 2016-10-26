bnf: main.c bnf.y
	bison bnf.y
	cc main.c
	rm bnf.tab.c
