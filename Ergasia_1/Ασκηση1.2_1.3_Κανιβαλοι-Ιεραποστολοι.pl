/*Να ορίσετε σε Prolog τον τρόπο αναπαράστασης των καταστάσεων καθώς και
τον τρόπο αναπαράστασης της εφαρμογής των τελεστών. */

arxikh_katastasi([3,3,0,0,left]).

teliki_katastasi([0,0,3,3,right]).

course([LI,LK,RI,RK,left],[LI1,LK1,RI1,RK1,right]):-/*1 ierap k 1 kaniv*/
	LI1 is LI-1,
	LK1 is LK-1,
	RK1 is RK+1,
	RI1 is RI+1.
	
course([LI,LK,RI,RK,left],[LI,LK1,RI,RK1,right]):-/*0 ierap k 2 kaniv*/
	LK1 is LK-2,
	RK1 is RK+2.
	
course([LI,LK,RI,RK,left],[LI1,LK,RI1,RK,right]):-/*2 ierap k 0 kaniv*/
	LI1 is LI-2,
	RI1 is RI+2.
	
course([LI,LK,RI,RK,left],[LI,LK1,RI,RK1,right]):-/*0 ierap k 1 kaniv*/
	LK1 is LK-1,
	RK1 is RK+1.
	
course([LI,LK,RI,RK,left],[LI1,LK,RI1,RK,right]):-/*1 ierap k 0 kaniv*/
	LI1 is LI-1,
	RI1 is RI+1.
	
	

course([LI,LK,RI,RK,right],[LI1,LK1,RI1,RK1,left]):-/*1 ierap k 1 kaniv*/
	LI1 is LI+1,
	LK1 is LK+1,
	RK1 is RK-1,
	RI1 is RI-1.
	
course([LI,LK,RI,RK,right],[LI,LK1,RI,RK1,left]):-/*0 ierap k 2 kaniv*/
	LK1 is LK+2,
	RK1 is RK-2.
	
course([LI,LK,RI,RK,right],[LI1,LK,RI1,RK,left]):-/*2 ierap k 0 kaniv*/
	LI1 is LI+2,
	RI1 is RI-2.
	
course([LI,LK,RI,RK,right],[LI,LK1,RI,RK1,left]):-/*0 ierap k 1 kaniv*/
	LK1 is LK+1,
	RK1 is RK-1.
	
course([LI,LK,RI,RK,right],[LI1,LK,RI1,RK,left]):-/*1 ierap k 0 kaniv*/
	LI1 is LI+1,
	RI1 is RI-1.
	
	
	
/* Να υλοποιήσετε το πρόβλημα χρησιμοποιώντας το πρόγραμμα 10.5 από το βιβλίο
του εργαστηρίου (έκδοση 2019) το οποίο βρίσκει τα μονοπάτια από μια αρχική
κατάσταση προς στις τελικές καταστάσεις σε κυκλικό γράφο. */
	
	
monopati(X, Y, Monopati) :-
		monopati1(X, Y, [X], Monopati),
		write(Monopati).

monopati1(X, X, Monopati, Monopati) :- 
			teliki_katastasi(X).
			
monopati1(X, Z, Monopati, Teliko_monopati) :-
		course(X, Y),
		\+ member(Y, Monopati),
		append(Monopati, [Y], Neo_monopati),
		monopati1(Y, Z, Neo_monopati, Teliko_monopati).