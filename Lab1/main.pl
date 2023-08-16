%parent data 
parent(ramesh,nitin).
parent(ramesh,ajit).
parent(ramesh,savita).
parent(ramesh,sachin).
parent(rajni,savita).
parent(rajni,nitin).
parent(rajni,sachin).
parent(rajni,ajit).
parent(sachin,sara).
parent(sachin,arjun).
parent(anjali,sara).
parent(anjali,arjun).
%gender data 
male(ramesh).
male(nitin).
male(ajit).
male(sachin).
male(arjun).
female(rajni).
female(savita).
female(anjali).
female(sara).

%functions for questions 3
grandparent(X,Y) :- parent(X,Z),parent(Z,Y). %grandparent relation
mother(X,Y) :- parent(X,Y),female(X). %mother relation
father(X,Y) :- parent(X,Y),male(X). %father relation
brother(X,Y) :- parent(Z,X),parent(Z,Y),male(X),X\=Y. %brother relation
sister(X,Y) :- parent(Z,X),parent(Z,Y),female(X),X\=Y. %sister relation

%functions for question 5
has_atleast_two_children(X) :- parent(X, Y1), parent(X, Y2),Y1 \= Y2,(sister(Y1, Y2) ; brother(Y1, Y2)).
grandchild(X,Y) :- grandparent(Y,X).
aunt(X,Y):-parent(Z,Y),sister(X,Z).
uncle(X,Y) :- parent(Z,Y),brother(X,Z).

%successor relation recursive function
successor(X, Y) :- parent(Y, X).
successor(X, Y) :- parent(Y, Z), successor(X, Z).
