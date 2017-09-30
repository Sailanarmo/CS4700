:- include(adventure).

connected(X,Y):-door(X,Y).
connected(X,Y):-door(Y,X).

shortDesc(Place):-short_desc(Place,Desc),write(Desc),nl,!.

listConnected(Place):-connected(Place,Other), name(Other,Name),write(Name),write(" - "),shortDesc(Other),fail.
listConnected(_).

listItems(Place):-location(X,Place),name(X,Name),write("a "),write(Name),write(" - "),shortDesc(X),fail.
listItems(_).

lookAtRoom(Room):-name(Room,Name),nl,write("You are in "),write(Name),nl,nl,write("You see around you: "),nl,listItems(Room),nl,write("It is Connected to"),nl,listConnected(Room),!.
