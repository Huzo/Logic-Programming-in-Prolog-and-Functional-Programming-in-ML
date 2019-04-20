% Rules
sum(0,X,X).
sum(s(X),Y,s(Z)) :- sum(X,Y,Z).

% 1.a Rules
natNum(0).
natNum(s(X)) :- natNum(X).

% 1.b Rules
lt(0,s(_)).
lt(s(X),s(Y)) :- lt(X,Y).

% 1.c Query
% ?- lt(X,s(s(s(0)))).

% 1.d Rules
geq(X,X).
geq(X,Y) :- lt(Y,X).

% 1.e Rules
max(X,Y,Z) :- Z=X, geq(X,Y).
max(X,Y,Z) :- Z=Y, geq(Y,X).

% 1.f Rules
difference(X,Y,Z) :- sum(Z,Y,X).

% 1.g Rules
mod(X,Y,Z) :- lt(Z,Y), geq(X,Z), difference(X,Z,D), multiple(Y,D).
multiple(X,0) :- X=s(_).
multiple(X,Y) :- X=s(_), Y=s(_), geq(Y,X), difference(Y,X,D), multiple(X,D).

% 2.a Rules
% bt(a,bt(nil,b,d),bt(c,bt(f,e,g),nil).

% 2.b Rules
btMember(E,bt(E,_L,_R)).
btMember(E,bt(_Rt,L,_R)) :- btMember(E,L).
btMember(E,bt(_Rt,_L,R)) :- btMember(E,R).
isTree(Term) :- btMember(Term, bt(_,_,_)).
