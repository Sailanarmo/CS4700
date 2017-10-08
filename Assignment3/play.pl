:- include(adventure).

connected(X,Y):-door(X,Y).
connected(X,Y):-door(Y,X).

printInventory(X):-write(X),nl,!.

inventory:-has(X),printInventory(X),fail.
inventory(_).

shortDesc(Place):-short_desc(Place,Desc),name(Place,Name),write(Name),write(" - "),write(Desc),nl,!.

longDesc(Object):-long_desc(Object,Desc),name(Object,Name),write(Name),write(" - "),write(Desc),nl,!.

listConnected(Place):-connected(Place,Other),shortDesc(Other),fail.
listConnected(_).

isConnected(Place):-connected(Place,Other),fail.
isConnected(_).

listItems(Place):-location(X,Place),shortDesc(X),fail.
listItems(_).


isItem(Item,P):-location(Item,P).
isItem(Item,P):-location(Container,P),isItem(Item,Container).

%========================================================

look(Room):-name(Room,Name),nl,write("You are in "), longDesc(Room),nl,nl,write("You see around you: "),nl,listItems(Room),nl,write("It is Connected to"),nl,listConnected(Room),!.

%if search is a container, then list the items, else it is an object and should return a desc.
search(Item):-(container(Item) -> write("You are searching "), longDesc(Item),nl,write("It Contains: "),nl, listItems(Item) ; longDesc(Item)),!.

move(P):-(here(X),connected(X,P) -> here(X),retract(here(X)),asserta(here(P)),look(P) ; write("I can't go there.")),!.

take(Item):-((here(X),isItem(Item,X) -> (isHeavy(Item) -> write("This item is too heavy for you to carry.") ; isItem(Item,X),retract(location(Item,P)),asserta(has(Item)),nl,write("You took the "), write(Item),write(" from the "),write(P),nl,nl,write("You have: "),nl,inventory) ; write("That Item does not exist."))),!.

put(Item,Location):-((here(Location) ; container(Location)),has(Item) -> retract(has(Item)),asserta(location(Item,Location)),nl,write("You put the "), write(Item), write(" in the "), write(Location),nl,nl, write("You have: "),nl,inventory ; write("You cannot put that Item there.")),!. 

%========================================================
