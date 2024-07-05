:- op(600, xfy,[\]).

add-end-diff-lists(Elem, DiffList, EndDiffList, NewDiffList, EndNewDiffList) :-
	EndDiffList =[Elem|EndNewDiffList],
	NewDiffList = DiffList.