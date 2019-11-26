/*a. For a list of integer number, write a predicate to add in list after 1-st, 3-rd, 7-th, 15-th element a given value e. b. For a heterogeneous list
 *b. For a heterogeneous list, formed from integer numbers and list of numbers;
 *   add in every sublist after 1-st, 3-rd, 7-th, 15-th element the
 *   value found before the sublist in the heterogenous list.
 *
 *   The list has the particularity that starts with a number and there aren’t two consecutive elements lists.
 *   Eg.: [1, [2, 3], 7, [4, 1, 4], 3, 6, [7, 5, 1, 3, 9, 8, 2, 7], 5]
 *   => [1, [2, 1, 3], 7, [4, 7, 1, 4, 7], 3, 6, [7, 6, 5, 1, 6, 3, 9,
 *   8, 2, 6, 7], 5].
 */

 %inputNo(l1..ln,index,E,R)=vida, L=vida
 %                        inputNo(l3..ln,index+1,E,l1 U E U l2 U R), index=1 || index=3|| index=7||index=15
 %                        inputNo(l2..ln,index+1,E,R), otherwise

 %coolFunction5000(L,R)=vida,L=vida
 %                      coolFunction5000(l3..ln,l1 U wInputNo(l2,l1,R) U l3..ln),l1 number && l2 list
 %                      coolFunction5000(l2..ln,l1 U R), otherwise

 %(i,i,o,o)

inputNo([],_,_,[]):-!.
inputNo([H|[]],I,E,[H,E|R]):-(I=1;I=3;I=7;I=15),Is is I+1,inputNo([],Is,E,R).
inputNo([_|[]],I,E,R):-(I\=1;I\=3;I\=7,I\=15),Is is I+1,inputNo([],Is,E,R).
inputNo([H1,H2|T],I,E,[H1,E,H2|R]):-(I=1;I=3;I=7;I=15),Is is I+1,inputNo([H2|T],Is,E,R).
inputNo([_,H2|T],I,E,R):-(I\=1;I\=3;I\=7,I\=15),Is is I+1,inputNo([H2|T],Is,E,R).

wInputNo(L,E,R):-inputNo(L,1,E,R).

%(i,o)
addInSublist([],[]):-!.
addInSublist([H|[]],[H|R]):- number(H), addInSublist([],R).
addInSublist([H1,H2|T],[H1,ResList|R]):-(is_list(H2),number(H1)),wInputNo(H2,H1,ResList),addInSublist(T,R).
addInSublist([H1,H2|T],[H1|R]):- \+(is_list(H2)),addInSublist([H2|T],R).
