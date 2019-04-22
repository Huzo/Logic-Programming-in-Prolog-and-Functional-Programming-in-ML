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
% bt(a,bt(b,nil,bt(d,nil,nil)),bt(c,bt(e,bt(f,nil,nil),bt(g,nil,nil)),nil)).

% 2.b Rules
isTree(nil).
isTree(bt(_E,nil,nil)).
isTree(bt(_E,L,nil)) :- isTree(L).
isTree(bt(_E,nil,R)) :- isTree(R).
isTree(bt(_E,L,R)) :- isTree(L), isTree(R).

% 2.c Rules
isLeaf(E,bt(E,nil,nil)).
isLeaf(E,bt(Rt,L,R)) :- isTree(bt(Rt,L,R)),isLeaf(E,L).
isLeaf(E,bt(Rt,L,R)) :- isTree(bt(Rt,L,R)),isLeaf(E,R).
