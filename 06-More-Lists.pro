%% -------
%% Chapter
%% -------

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

%% naive_reverse/2
naive_reverse([], []).
naive_reverse([Head|Tail], Rev) :-
    naive_reverse(Tail, TailRev),
    append(TailRev, [Head], Rev).

%% acc_reverse/3
acc_reverse([], Acc, Acc).
acc_reverse([ListHead|ListTail], Acc, Rev) :-
    acc_reverse(ListTail, [ListHead|Acc], Rev).

%% acc_reverse/2
acc_reverse(List, Rev) :-
    acc_reverse(List, [], Rev).


%% ----
%% Ex 1
%% ----

%% doubled/1
doubled(L) :-
    prefix(P, L),
    append(P, P, L).


%% ----
%% Ex 2
%% ----

%% palindrome/1
palindrome(L) :-
    acc_reverse(L, L).


%% ----
%% Ex 3
%% ----

%% toptail/2
toptail([_|InTail], Out) :-
    append(Out, [_], InTail).

%% toptail/4
toptail([First|Tail], First, Body, Last) :-
    append(Body, [Last], Tail).


%% ----
%% Ex 4
%% ----

%% reversive_last/2
reversive_last(List, Last) :-
    acc_reverse(List, [Last|_]).

%% recursive_last/2
recursive_last([Last], Last).
recursive_last([_|Tail], Last) :-
    recursive_last(Tail, Last).


%% ----
%% Ex 5
%% ----

%% swapfl/2
swapfl(In, Out) :-
    toptail(In, First, Body, Last),
    toptail(Out, Last, Body, First).

%% TODO: Add recursive definition


%% ----
%% Ex 6
%% ----

to_the_right(house(R), house(L)) :-
    to_the_left(house(L), house(R)).

house(Color) :-
    member(Color, [red, green, blue]).

neighbor(Nationality) :-
    member(Nationality, [english, spanish, japanese]).

pet(Animal) :-
    member(Animal, [jaguar, snail, zebra]).


%% lives_in(neighbor(N), house(H)).
%% lives_in(neighbor(english), house(red)).
%% lives_in(neighbor(japanese), house(H1)) :-
%%     to_the_right(house(H1), house(H2)),
%%     lives_in(neighbor(N), house(H2)),
%%     belongs_to(pet(snail), neighbor(N)).

%% belongs_to(pet(P), neighbor(N)).
%% belongs_to(pet(jaguar), neighbor(spanish)).
%% belongs_to(pet(snail), neighbor(N)) :-
%%     lives_in(neighbor(N), house(H)),
%%     to_the_left(house(H), house(blue)).

%% zebra(N) :-
%%     belongs_to(pet(zebra), neighbor(N)).


%% TODO: Add solutions for Ps
