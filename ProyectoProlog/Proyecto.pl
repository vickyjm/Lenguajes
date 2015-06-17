valA([H|[]]) :- integer(H),(H < 10),(H > 0).
valA([H|T]) :- integer(H),(H < 10),(H > 0),valA(T).


lenVal([H|[]]).
lenVal([H1|[H2|T]]) :- length(H2,X),(length(H1,X)),lenVal([H2|T]).

tableroValido([H|[]]) :- valA(H).
tableroValido([H|T]) :- valA(H),tableroValido(T),lenVal([H|T]).