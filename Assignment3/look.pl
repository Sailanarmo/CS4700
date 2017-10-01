:- include(adventure).

connected(X,Y):-door(X,Y).
connected(X,Y):-door(Y,X).


shortDesc(Place):-short_desc(Place,Desc),name(Place,Name),write(Name),write(" - "),write(Desc),nl,!.

longDesc(Object):-long_desc(Object,Desc),name(Object,Name),write(Name),write(" - "),write(Desc),nl,!.

listConnected(Place):-connected(Place,Other),shortDesc(Other),fail.
listConnected(_).

listItems(Place):-location(X,Place),shortDesc(X),fail.
listItems(_).


%========================================================

look(Room):-name(Room,Name),nl,write("You are in "),write(Name),nl,nl,write("You see around you: "),nl,listItems(Room),nl,write("It is Connected to"),nl,listConnected(Room),!.

%if search is a container, then list the items, else it is an object and should return a desc.
search(Item):-(container(Item) -> listItems(Item) ; longDesc(Item)),!.
