% For a list a1... an with integer and distinct numbers,
% define a predicate to determine all subsets with sum of elements
% divisible with n.

%noOfElems(L,N)={N=N+1,noOfElems(l2..ln,N) (i,o)
% L-list,N-integer
noOfElems([],0).
noOfElems([_|T],N):-noOfElems(T,N1), N is N1+1.

%sub(L,R)={l1 U R, sub(l2..ln,R)
%         {sub(l2..ln,R)
%(i,o)
%L-list, R-list
sub([],[]).
sub([A|L],[A|L1]):-sub(L,L1).
sub([_|L],L1):-sub(L,L1).

%sum(L,S)={S=S+l1,sum(T,S)
%(i,o)
%L-list,S-integer
sum([],0).
sum([H|T],S):-sum(T,S1),S is S1+H.

%(i,o)
%L-list,R1-list
solve(L, N,R1):-  sub(L, R1), sum(R1, Sum),R1 \=[], Sum mod N =:= 0.
