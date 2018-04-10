%% =======
%% Chapter
%% =======

%% naive append/3
append([], L, L).
append([H|T1], L2, [H|T3]) :-
    append(T1, L2, T3).

%% prefix/2
prefix(P, L) :-
    append(P, _, L).

%% suffix/2
suffix(S, L) :-
    append(_, S, L).

%% sublist/2
sublist(SubList, List) :-
    suffix(Suffix, List),
    prefix(SubList, Suffix).

%% naiverev/2
naiverev([], []).
naiverev([Head|Tail], Rev) :-
    naiverev(Tail, TailRev),
    append(TailRev, [Head], Rev).

%% accrev/3
accrev([], Acc, Acc).
accrev([ListHead|ListTail], Acc, Rev) :-
    accrev(ListTail, [ListHead|Acc], Rev).

%% accrev/2
accrev(List, Rev) :-
    accrev(List, [], Rev).

%% =========
%% Exercises
%% =========

%% Exercise 6.1
%% ------------

%% doubled/1
doubled(L) :-
    prefix(P, L),
    append(P, P, L).

%% Exercise 6.2
%% ------------

%% palindrome/1
palindrome(L) :-
    accrev(L, L).

%% Exercise 6.3
%% ------------

%% toptail/2
toptail([_|InTail], Out) :-
    append(Out, [_], InTail).

%% Exercise 6.4
%% ------------

%% revlast/2
revlast(List, Last) :-
    accrev(List, [Last|_]).

%% reclast/2
reclast([Last], Last).
reclast([_|Tail], Last) :-
    reclast(Tail, Last).

%% Exercise 6.5
%% ------------

%% TODO: Implement

%% Exercise 6.6
%% ------------

%% TODO: Implement


%% =================
%% Practical session
%% =================

%% TODO: Implement
