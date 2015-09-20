%torres de hanoi
:- dynamic torre/2.
torre(1,[]).
torre(2,[]).
torre(3,[]).
agregarPila(_,0).
agregarPila(NoTorre,Cantidad):- 
			agregarElementoF(NoTorre,Cantidad),
			Ncantidad is Cantidad-1, 
			agregarPila(NoTorre,Ncantidad).

hanoi(N,Origen,Auxiliar,Destino):-
			agregarPila(Origen,N),
			write('---------torres de Hanoi---------- \n'),
			write('---------de torre '), write(Origen), write(':\n'),
			torre(Origen,Elementos), write(Elementos),
			write('\n a torre '),write(Destino),write(':\n'),
			torre(Destino,Elementos3), write(Elementos3),
			write('------ \n'),
			hanoi1(N,Origen,Auxiliar,Destino),
			write('RESULTADO:\n'),
			write('torre de origen: \n'),
			torre(Origen,Elementos1),write(Elementos1),
			write('torre de destino: \n'),
			torre(Destino,Elementos2),write(Elementos2).


hanoi1(0,_,_,_).	
hanoi1(N,Origen,Auxiliar,Destino):- N1 is N-1,
	hanoi1(N1,Origen,Destino,Auxiliar),
	pasos(Origen,Destino),
	hanoi1(N1,Auxiliar,Origen,Destino).
pasos(Origen,Destino):-
	write(' desde la torre '),
	write(Origen),
	write(' hasta la torre '),
    write(Destino),
    eliminar(Origen, ElementoMover),
    agregarElementoF(Destino,ElementoMover),
    write(' el Elemento '),
    write(ElementoMover),
    write('\n').


eliminar(NoTorre,Cabeza):-torre(NoTorre,Elementos),
							dameCabeza(Elementos,Cabeza,Cola),
							retract(torre(NoTorre, Elementos)), 
							assert(torre(NoTorre, Cola)).
agregarElementoF(NoTorre,Elemento):-
									torre(NoTorre,Elementos),
									agregarInicio(Elemento,Elementos,NElementos),
										retract(torre(NoTorre,Elementos)), 
									assert(torre(NoTorre, NElementos)).
agregarInicio(Elemento,Lista,[Elemento|Lista]).
dameCabeza([C|_],C). 
dameCabeza([C|Cola],C,Cola).