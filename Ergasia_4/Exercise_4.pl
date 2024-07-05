:- dynamic clause2/2 ,solve/1 .
:- include('original_programm_exercise4.pl'). % My main programm

% MENU
menu:- 
	save,
    write('Main Menu'),nl,                     
	write('Select 1: Program Update.'),nl,
	write('Select 2: Run Goals.'),nl,
	write('Select 3 or other : Exit.'),nl,
    read(Num),nl,
    choice(Num).
	
choice(1) :- choice1.			%Actions
choice(2) :- choice2.
choice(Num) :- write('EXIT').

%Choice 1
choice1:-
	write('Program Update'),nl,                      
	write('Select a: Change a clause.'),nl,
	write('Select b: Insert new clause.'),nl,
	write('Select c: Delete a clause'),nl,
	write('Select d: Main menu'),nl,
    read(Ch),nl,
    choice1_1(Ch).
	
% REPLACE A CLAUSE
choice1_1(a):- 
	write('Give clause to replace'),nl,
	read(Old_clause),nl,
	write('Give new clause like : [Goal , Body]'),nl,
	read(New_clause),nl,
	retract(clause2(Old_clause , _)),
	assert_new(New_clause),
	save,menu.
	
assert_new([H|[H1|T]]) :- asserta(clause2(H,H1)).
	
% INSERT A CLAUSE
choice1_1(b):- 
	write('Give the new clause'),nl,           
	read(New_clause),nl,
	assert(clause2(New_clause,true)),nl,
	save,menu.
		
% DELETE A CLAUSE		
choice1_1(c):- 
	write('Give clause to delete'),nl,         
	read(Del_clause),nl,
	retract(clause2(Del_clause,_)),nl,
	save,menu.

choice1_1(d):- menu.


%Choice 2 RUN GOALS
choice2:- 
	write('Run Goals'),nl,                      
	write('Select a: Run a clause.'),nl,
	write('Select b: Main Menu.'),nl,
	read(Ch),nl,
    choice2_1(Ch).

choice2_1(a):- 
	write('Give a goal'),nl,
	read(Goal),
	solve(Goal),nl,
	fail,
	menu.
	
choice2_1(b):- menu.



save:- tell('C:/Users/sfina/OneDrive/Desktop/final_programm_exercise4.pl'),
	retractall(solve),
    retractall(clause2),
	listing(solve),
    listing(clause2),
    told.






