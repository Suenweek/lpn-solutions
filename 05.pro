% ---------
% Exercices
% ---------

% increment/2
increment(X, Y) :-
    Y is X + 1.

% sum/3
sum(X, Y, Z) :-
    Z is X + Y.

% addone/2
addone([], []).
addone([H|T], [Hi|Ti]) :-
    Hi is H + 1,
    addone(T, Ti).


% -----------------
% Practical session
% -----------------

% accMin/3
accMin([], A, A).
accMin([H|T], A, M) :-
    H < A,
    accMin(T, H, M).
accMin([H|T], A, M) :-
    H >= A,
    accMin(T, A, M).

% min/2
min([H|T], M) :-
    accMin(T, H, M).

% scalarMult/3
scalarMult([], _, []).
scalarMult([ListHead|ListTail], Factor, [ResultHead|ResultTail]) :-
    ResultHead is ListHead * Factor,
    scalarMult(ListTail, Factor, ResultTail).

% accDotProd/3
accDotProd([], [], A, A).
accDotProd([H1|T1], [H2|T2], A, R) :-
    P is A + H1 * H2,
    accDotProd(T1, T2, P, R).

% dotProd/2
dotProd(L1, L2, R) :-
    accDotProd(L1, L2, 0, R).

