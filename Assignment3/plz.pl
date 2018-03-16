parse([V,O],L):-verb(V,L-Up),obj(O,NP-[])

verb(move,["move"|X]-X).
verb(move,["move","to"|X]-X).
obj(hall,["hall"|X]-X).

parse([V,O],["Move","to","hall"]]).


