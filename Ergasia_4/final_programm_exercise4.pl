solve(true) :- !.
solve((A,B)) :- !,
        solve(A),
        solve(B).
solve(A) :-
        \+predicate_property(user:A,built_in),
        clause2(A, B),
        solve(B).
solve(A) :-
        predicate_property(user:A, built_in),
        call(user:A).

clause2(monopati1(A,A,B,C), C=B).
clause2(monopati1(A,B,C,D), (akme(A,E),\+member(E,C),append(C,[E],F),monopati1(E,B,F,D))).
clause2(monopati(A,B,C), (monopati1(A,B,[A],C),write(C))).
clause2(member(A,[B|_]), A=B).
clause2(member(A,[B|C]), (A\=B,member(A,C))).
clause2(append([],A,A), true).
clause2(append([A|B],C,[A|D]), append(B,C,D)).
clause2(akme(a,c), true).
clause2(akme(c,e), true).
clause2(akme(c,f), true).
clause2(akme(b,c), true).
clause2(akme(b,d), true).
clause2(akme(d,f), true).
clause2(akme(d,g), true).
clause2(akme(e,a), true).

