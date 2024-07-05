solve(true) :- !.
solve((A, B)) :- !,
			solve(A),
			solve(B).
solve(Goal) :-
		\+(predicate_property(Goal,built_in)),
		clause2(Goal,Body),
		solve(Body).
		
solve(Goal) :-
		predicate_property(Goal,built_in),
		call(Goal).

clause2(monopati1(X,X,Monopati,Monopati),true).

clause2(monopati1(X,Z,Monopati,Teliko_monopati),(akme(X,Y),\+(member(Y,Monopati)),append(Monopati,[Y],Neo_monopati),monopati1(Y,Z,Neo_monopati,Teliko_monopati))).

clause2(monopati(X, Y, Monopati), (monopati1(X, Y, [X], Monopati),write(Monopati))).

clause2(member(X,[H|T]),(X=H)).

clause2(member(X,[H|T]),(X\=H , member(X,T))).

clause2(append([],L2,L2),true).

clause2(append([H1|T1], L2, [H1|T3]),(append(T1,L2,T3))).

clause2(akme(a, c), true).
clause2(akme(c, a), true).
clause2(akme(c, e), true).
clause2(akme(c, f), true).
clause2(akme(b, c), true).
clause2(akme(b, d), true).
clause2(akme(d, f), true).
clause2(akme(d, g), true).
