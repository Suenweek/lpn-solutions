%% =========
%% Exercices
%% =========

%% Exercice 5.2
%% ------------

%% increment/2
increment(X, Y) :-
    Y is X + 1.

%% sum/3
sum(X, Y, Z) :-
    Z is X + Y.

%% Exercice 5.3
%% ------------

%% addone/2
addone([], []).
addone([H|T], [Hi|Ti]) :-
    Hi is H + 1,
    addone(T, Ti).


%% =================
%% Practical session
%% =================

%% 1. Min with accumulator
%% -----------------------

%% acc_min/3
acc_min([], A, A).
acc_min([H|T], A, M) :-
    H < A,
    acc_min(T, H, M).
acc_min([H|T], A, M) :-
    H >= A,
    acc_min(T, A, M).

%% min/2
min([H|T], M) :-
    acc_min(T, H, M).

%% 2. Scalar multiplication
%% ------------------------

%% scalar_mult/3
scalar_mult([], _, []).
scalar_mult([ListHead|ListTail], Factor, [ResHead|ResTail]) :-
    ResHead is ListHead * Factor,
    scalar_mult(ListTail, Factor, ResTail).

%% 3. Dot product with accumulator
%% -------------------------------

%% acc_dot_prod/4
acc_dot_prod([], [], A, A).
acc_dot_prod([H1|T1], [H2|T2], A, R) :-
    P is A + H1 * H2,
    acc_dot_prod(T1, T2, P, R).

%% dot_prod/3
dot_prod(L1, L2, R) :-
    acc_dot_prod(L1, L2, 0, R).
