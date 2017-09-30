:-include(adventure).



listThings(Place):-location(X,Place),name(X,Name),write(Name),nl,fail. 
listThings(_).

look(Place):-name(Place,Name),write(Name),nl,write("Contains:"),nl,listThings(Place).
