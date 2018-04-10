%% ----
%% Ex 4
%% ----

%% word/8
word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

%% crossword/6
crossword(V1, V2, V3, H1, H2, H3) :-
    word(H1, _,V1xH1,_,V2xH1,_,V3xH1,_),
    word(H2, _,V1xH2,_,V2xH2,_,V3xH2,_),
    word(H3, _,V1xH3,_,V2xH3,_,V3xH3,_),
    word(V1, _,V1xH1,_,V1xH2,_,V1xH3,_),
    word(V2, _,V2xH1,_,V2xH2,_,V2xH3,_),
    word(V3, _,V3xH1,_,V3xH2,_,V3xH3,_).
