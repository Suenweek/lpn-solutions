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
toptail(In, Out) :-
    append([_|Out], [_], In).

%% toptail/4
toptail(List, First, Body, Last) :-
    append([First|Body], [Last], List).


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


%% ----
%% Ex 6
%% ----

%% street/1
street(Street) :-
    Street = [_, _, _],

    %% The Englishman lives in the red house
    member(house(red, english, _), Street),

    %% The jaguar is the pet of the Spanish family
    member(house(_, spanish, jaguar), Street),

    %% The Japanese lives to the right of the snail keeper
    sublist([house(_, _, snail), house(_, japanese, _)], Street),

    %% The snail keeper lives to the left of the blue house
    sublist([house(_, _, snail), house(blue, _, _)], Street).

%% zebra/1
zebra(Owner) :-
    street(Street),
    member(house(_, Owner, zebra), Street).


%% ----
%% Ps 1
%% ----

%% amember/2
amember(Item, List) :-
    append(_, [Item|_], List).


%% ----
%% Ps 2
%% ----

%% subset/2
subset([], _).
subset([H|T], Set) :-
    member(H, Set),
    subset(T, Set).

%% s_set/2
s_set(List, Set) :-
    length(List, LenL),
    length(Set, LenS),
    LenL >= LenS,
    subset(List, Set).

%% acc_set/3
acc_set([], Set, Set).
acc_set([ListHead|ListTail], Acc, Set) :-
    not(member(ListHead, Acc)),
    append(Acc, [ListHead], NewAcc),
    acc_set(ListTail, NewAcc, Set).
acc_set([ListHead|ListTail], Acc, Set) :-
    member(ListHead, Acc),
    acc_set(ListTail, Acc, Set).

%% a_set/2
a_set(List, Set) :-
    acc_set(List, [], Set).
