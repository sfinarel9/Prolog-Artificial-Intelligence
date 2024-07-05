ins_sort(S, Q) :-
    empty_seq(S),
    empty_seq(Q).

ins_sort(S, Q) :-
    \+ empty_seq(S),
    head(S, E),
    tail(S, S1),
    ins_sort(S1, Q1),
    ins_elem(E,Q1, Q). 

ins_elem(E,Q1, Q) :-
    empty_seq(Q1),
    seq_cons(Q1,E, Q). 

ins_elem(E,Q1, Q) :-
    head(Q1, V1),
    E @=<V1,
    seq_cons(Q1,E, Q).

ins_elem(E,Q1, Q) :-
    head(Q1, V),
    E @> V,
    tail(Q1, Q1a),
    ins_elem(E,Q1a, Qa),
    seq_cons(Qa,V, Q). 


empty_seq([]).

head([H|T], H).

tail([H|T], T).

seq_cons(Q, X, [X|Q]).