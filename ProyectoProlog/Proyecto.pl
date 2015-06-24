% Laboratorio de Lenguajes I.
% Proyecto de Prolog.
% Jorge Marcano : 11-10566
% Maria Victoria Jorge : 11-10495

% Funcion para chequear que cada elemento del tablero sea un entero entre 1 y 9.
valA([H|[]]) :- integer(H),(H < 10),(H > 0).
valA([H|T]) :- integer(H),(H < 10),(H > 0),valA(T).

% Funcion para chequear si todaslas filas del tablero tienen igual longitud.
lenVal([_|[]]).
lenVal([H1|[H2|T]]) :- length(H2,X),(length(H1,X)),lenVal([H2|T]).

% Funcion tableroValido.
tableroValido([H|[]]) :- valA(H).
tableroValido([H|T]) :- valA(H),tableroValido(T),lenVal([H|T]).

numIguales([],_,_,_).
numIguales([_|T],X,Y,Elem) :- X1 is X-1, X > 0, numIguales(T,X1,Y,Elem).
numIguales([H|_],0,Y,Elem) :- Y1 is Y+1, nth(Y1,H,Elem).

% Funcion para calcularel numero de columnas del tablero.
numColums([H|_],Tam) :- length(H,Tam).

% Funcion satoEnPosicion.
saltoEnPosicion(Tablero,0,X,Y,solucion([H],X,Y,[])) :- tableroValido(Tablero),
													   numIguales(Tablero,X,Y,H).  %Caso base cuando no hay mas movimientos

% Caso norte.
saltoEnPosicion(Tablero,N,X,Y,solucion([HS|TS],X,Y,[norte|TM])) :- 
												X1 is X-1, 
												X1 >= 0, 
												N1 is N-1, 
												N1 >= 0,
												saltoEnPosicion(Tablero,N1,X1,Y,solucion(TS,X1,Y,TM)),
												numIguales(Tablero,X,Y,HS).

% Caso sur.
saltoEnPosicion(Tablero,N,X,Y,solucion([HS|TS],X,Y,[sur|TM])) :- 
												X1 is X+1,
												length(Tablero,Tam),
												X1 < Tam,
												N1 is N-1,
												N1 >= 0,
												saltoEnPosicion(Tablero,N1,X1,Y,solucion(TS,X1,Y,TM)),
												numIguales(Tablero,X,Y,HS).

% Caso este.
saltoEnPosicion(Tablero,N,X,Y,solucion([HS|TS],X,Y,[este|TM])) :- 
												Y1 is Y+1,
												numColums(Tablero,Tam),
												Y1 < Tam,
												N1 is N-1,
												N1 >= 0,
												saltoEnPosicion(Tablero,N1,X,Y1,solucion(TS,X,Y1,TM)),
												numIguales(Tablero,X,Y,HS).

% Caso oeste.
saltoEnPosicion(Tablero,N,X,Y,solucion([HS|TS],X,Y,[oeste|TM])) :- 	
												Y1 is Y-1, 
												Y1 >= 0, 
												N1 is N-1, 
												N1 >= 0,
												saltoEnPosicion(Tablero,N1,X,Y1,solucion(TS,X,Y1,TM)),
												numIguales(Tablero,X,Y,HS).
								
% Implementacion del predicado between de SWI prolog. (Para que funcione tambien con gprolog).				
auxRango(I,J,I) :- I =< J.
auxRango(I,J,K) :- I < J, I1 is I+1, auxRango(I1,J,K).

% Funcion salto.
salto([H|T],N,S) :- tableroValido([H|T]),						% Chequeamos si el tablero es valido.
					length(T,A1),length(H,A3),					% A1 y A3 toman el valor del numero de filas y columnas respectivamente.
					A2 is A3-1,									% A2 toma el valor de A3-1.		
					auxRango(0,A1,X1),auxRango(0,A2,Y1),		% X1 y Y1 iteran sobre los distintos valores posibles de X y Y en el tablero.
					saltoEnPosicion([H|T],N,X1,Y1,S).			% saltoEnPosicion se ejecuta para cada X y Y del tablero hasta encontrar una.