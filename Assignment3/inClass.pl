parse([V],InList):-verb(V,InList-[]).

parse([V,O],InList):-verb(V,InList-NounPhrase), noun(O,NounPhrase-[]).

verb(aciton,["a","b"|X]-X).

verb(look,["look","at"|X]-X).
noun(fly,["fly"|X]-X).

noun(L ,["outside"|X]-X:-here(H),outdoor(H),fail.
