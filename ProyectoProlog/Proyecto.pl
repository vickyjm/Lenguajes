valA([H|[]]) :- integer(H),(H < 10),(H > 0).
valA([H|T]) :- integer(H),(H < 10),(H > 0),valA(T).

lenVal([_|[]]).
lenVal([H1|[H2|T]]) :- length(H2,X),(length(H1,X)),lenVal([H2|T]).

tableroValido([H|[]]) :- valA(H).
tableroValido([H|T]) :- valA(H),tableroValido(T),lenVal([H|T]).

numIguales([],_,_,_).
numIguales([_|T],X,Y,Elem) :- X1 is X-1, X > 0, numIguales(T,X1,Y,Elem).
numIguales([H|_],0,Y,Elem) :- Y1 is Y+1, nth(Y1,H,Elem).

numColums([H|_],Tam) :- length(H,Tam).

saltoEnPosicion(Tablero,0,X,Y,solucion([H],X,Y,[])) :- numIguales(Tablero,X,Y,H).  %Caso base cuando no hay mas movimientos

saltoEnPosicion(Tablero,N,X,Y,solucion([HS|TS],X,Y,[norte|TM])) :- 
												X1 is X-1, 
												X1 >= 0, 
												N1 is N-1, 
												N1 >= 0,
												saltoEnPosicion(Tablero,N1,X1,Y,solucion(TS,X1,Y,TM)),
												numIguales(Tablero,X,Y,HS).

saltoEnPosicion(Tablero,N,X,Y,solucion([HS|TS],X,Y,[sur|TM])) :- 
												X1 is X+1,
												length(Tablero,Tam),
												X1 < Tam,
												N1 is N-1,
												N1 >= 0,
												saltoEnPosicion(Tablero,N1,X1,Y,solucion(TS,X1,Y,TM)),
												numIguales(Tablero,X,Y,HS).

saltoEnPosicion(Tablero,N,X,Y,solucion([HS|TS],X,Y,[este|TM])) :- 
												Y1 is Y+1,
												numColums(Tablero,Tam),
												Y1 < Tam,
												N1 is N-1,
												N1 >= 0,
												saltoEnPosicion(Tablero,N1,X,Y1,solucion(TS,X,Y1,TM)),
												numIguales(Tablero,X,Y,HS).

saltoEnPosicion(Tablero,N,X,Y,solucion([HS|TS],X,Y,[oeste|TM])) :- 	
												Y1 is Y-1, 
												Y1 >= 0, 
												N1 is N-1, 
												N1 >= 0,
												saltoEnPosicion(Tablero,N1,X,Y1,solucion(TS,X,Y1,TM)),
												numIguales(Tablero,X,Y,HS).
