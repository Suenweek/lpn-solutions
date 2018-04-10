%% =========
%% Exercises
%% =========

%% Exercise 4.3
%% ------------

%% second/2
second(X, [_,X|_]).

%% Exercise 4.4
%% ------------

%% swap12
swap12([A1,A2|T], [A2,A1|T]).

%% Exercise 4.5
%% ------------

%% tran/2
tran(eins,   one).
tran(zwei,   two).
tran(drei,   three).
tran(vier,   four).
tran(fuenf,  five).
tran(sechs,  six).
tran(sieben, seven).
tran(acht,   eight).
tran(neun,   nine).

%% listtran/2
listtran([], []).
listtran([Hg|Tg], [He|Te]) :-
    tran(Hg, He),
    listtran(Tg, Te).

%% Exercise 4.6
%% ------------

%% twice/2
twice([], []).
twice([H|T], [H,H|T2]) :-
    twice(T, T2).


%% =================
%% Practical session
%% =================

%% TODO: Implement
