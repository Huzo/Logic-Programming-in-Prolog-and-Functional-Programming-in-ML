% Rules
sum(0,X,X).
sum(s(X),Y,s(Z)) :- sum(X,Y,Z).

% 1.a Rules
natNum(0).
natNum(s(X)) :- natNum(X).

% 1.b Rules
lt(0,s(X)) :- natNum(X).
lt(s(X),s(Y)) :- lt(X,Y).

% 1.c Query
% ?- lt(X,s(s(s(0)))).

% 1.d Rules
geq(X,X).
geq(X,Y) :- lt(Y,X).

% 1.e Rules
max(X,Y,Z) :- Z=X, geq(X,Y).
max(X,Y,Z) :- Z=Y, geq(Y,X).
