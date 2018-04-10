%% =========
%% Exercises
%% =========

%% Exercise 1.4
%% ------------

%% 1. Butch is a killer.
killer(butch).

%% 2. Mia and Marsellus are married.
married(mia, marsellus).

%% 3. Zed is dead.
dead(zed).

%% 4. Marsellus kills everyone who gives Mia a footmassage.
kills(marsellus, Person) :-
    gives_footmassage(Person, mia).

%% 5. Mia loves everyone who is a good dancer.
loves(mia, Person) :-
    good_dancer(Person).

%% 6. Jules eats anything that is nutritious or tasty.
eats(jules, Food) :-
    nutritious(Food),
    tasty(Food).
