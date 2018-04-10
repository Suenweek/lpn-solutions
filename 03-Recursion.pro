%% ----
%% Ex 2
%% ----

%% directly_in/2
directly_in(irina, natasha).
directly_in(natasha, olga).
directly_in(olga, katarina).

%% in/2
in(X, Y) :-
    directly_in(X, Y).
in(X, Y):
    directly_in(X, Z),
    in(Z, Y).


%% ----
%% Ex 3
%% ----

%% direct_train/2
direct_train(saarbruecken, dudweiler).
direct_train(forbach, saarbruecken).
direct_train(freyming, forbach).
direct_train(stAvold, freyming).
direct_train(fahlquemont, stAvold).
direct_train(metz, fahlquemont).
direct_train(nancy, metz).

%% travel_from_to/2
travel_from_to(X, Y) :-
    direct_train(X, Y).
travel_from_to(X, Y) :-
    direct_train(X, Z),
    travel_from_to(Z, Y).


%% ----
%% Ex 4
%% ----

%% greater_than/2
greater_than(succ(X), X).
greater_than(succ(X), Y) :-
    greater_than(X, Y).


%% ----
%% Ex 5
%% ----

%% swap/2
swap(leaf(L), leaf(L)).
swap(tree(X, Y), tree(Ys, Xs)) :-
    swap(X, Xs),
    swap(Y, Ys).


%% ----
%% Ps 1
%% ----

%% connected/2
connected( 1,  2).
connected( 3,  4).
connected( 5,  6).
connected( 7,  8).
connected( 9, 10).
connected(12, 13).
connected(13, 14).
connected(15, 16).
connected(17, 18).
connected(19, 20).
connected( 4,  1).
connected( 6,  3).
connected( 4,  7).
connected( 6, 11).
connected(14,  9).
connected(11, 15).
connected(16, 12).
connected(14, 17).
connected(16, 19).

%% path/2
path(A, B) :-
    connected(A, B).
path(A, B) :-
    connected(A, C),
    path(C, B).


%% ----
%% Ps 2
%% ----

%% by_car/2
by_car(auckland, hamilton).
by_car(hamilton, raglan).
by_car(valmont,  saarbruecken).
by_car(valmont,  metz).

%% by_train/2
by_train(metz,         frankfurt).
by_train(saarbruecken, frankfurt).
by_train(metz,         paris).
by_train(saarbruecken, paris).

%% by_plane/2
by_plane(frankfurt,  bangkok).
by_plane(frankfurt,  singapore).
by_plane(paris,      losAngeles).
by_plane(bangkok,    auckland).
by_plane(singapore,  auckland).
by_plane(losAngeles, auckland).

%% travel/2
travel(A, B) :-
    by_car(A, B);
    by_train(A, B);
    by_plane(A, B).
travel(A, B) :-
    (
        by_car(A, C);
        by_train(A, C);
        by_plane(A, C)
    ),
    travel(C, B).


%% ----
%% Ps 3
%% ----

%% travel/3
travel(A, B, go(A, B)) :-
    by_car(A, B);
    by_train(A, B);
    by_plane(A, B).
travel(A, B, go(A, C)) :-
    (
        by_car(A, C);
        by_train(A, C);
        by_plane(A, C)
    ),
    travel(C, B).


%% TODO: Add solution for Ps 4
