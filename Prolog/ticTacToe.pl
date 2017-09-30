:- dynamic cell/2. %the location, and who has played there. 2 Parameters
:- dynamic turn/1. %To force taking turns

turn(x).

nextTurn(x,o).
nextTurn(o,x).

can_move(Location):-cell(Location,_),!,fail. %If something is here, you cannot move here.
can_move(_). %Other wise it is true.

%all the horizontal wins
win(Player):-cell(uLeft,Player),cell(uCenter,Player),cell(uRight,Player).
win(Player):-cell(cLeft,Player),cell(cCenter,Player),cell(cRight,Player).
win(Player):-cell(lLeft,Player),cell(lCenter,Player),cell(lRight,Player).

%all the vertical wins
win(Player):-cell(uLeft,Player),cell(cLeft,Player),cell(lLeft,Player).
win(Player):-cell(uCenter,Player),cell(cCenter,Player),cell(lCenter,Player).
win(Player):-cell(uRight,Player),cell(cRight,Player),cell(lRight,Player).

%all the diagonal wins
win(Player):-cell(uLeft,Player),cell(cCenter,Player),cell(lRight,Player).
win(Player):-cell(uRight,Player),cell(cCenter,Player),cell(lLeft,Player).

move(Location,Player):-can_move(Location),asserta(cell(Location,Player)).%can you move? If you can move, insert yourself here.


play(Location):-turn(Player),move(Location,Player),nextTurn(Player,Other),retract(turn(Player)),asserta(turn(Other)). 

displayCell(L):-cell(L,P),write(P),!.
displayCell(_):-write(" ").

displayBoard:-displayCell(uLeft),write("|"),displayCell(uCenter),write("|"),displayCell(uRight),nl,write("-+-+-"),nl,
displayCell(cLeft),write("|"),displayCell(cCenter),write("|"),displayCell(cRight),nl,write("-+-+-"),nl,
displayCell(lLeft),write("|"),displayCell(lCenter),write("|"),displayCell(lRight),nl.

clear:-cell(L,P),retract(cell(L,P)).
