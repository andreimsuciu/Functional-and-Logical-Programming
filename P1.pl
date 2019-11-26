/*a. Write a predicate to remove all occurrences of a certain atom from a list.
 *b. Define a predicate to produce a list of pairs (atom n) from an
 *initial list of atoms. In this initial list atom has n occurrences.
 *Eg.: numberAtom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3,1]].
 */

/*a)rem atom
 *remAtom(X,l1..ln)={ [], list is empty
 *                  { l1 U remAtom(E,l2..ln), l1 is not X
 *                  { remAtom(X,l2..ln)
 */
/*b)numberAtom(l1..ln)={[],list is empty
 *                     {[l1, atomNo(l1,l1..ln)] U numberAtom(remAtom(l1,l1..ln)) 
 *  atomNo(x,l1..ln)={0, list is empty
 *                   {1+atomNo(l2..ln), x=l1
 *                   {atomNo(l2..ln),otherwise
 */
%AtomNo(l-initial list,e-element to count,r-result)
%(i,o)

atomNo([],_,0):-!.
atomNo([H|T],E,R):- H==E,!, atomNo(T,E,Rs),R is Rs+1.
atomNo([H|T],E,R):- H\=E, atomNo(T,E,R).

%remAtom(L-initial list,E-element,R-resulted list)
%(i,i,o)

remAtom([],_,[]):-!.
remAtom([H|T],E,[H|L]):- H\=E, remAtom(T,E,L).
remAtom([H|T],E,L):- H==E, remAtom(T,E,L).

%numberAtom(l-initial list,R-result)
%(i,o)

numberAtom([],[]):-!.
numberAtom([H|T], [Hr|Tr]) :- atomNo([H|T],H,R1), remAtom(T, H, RemovedList), Hr = [H, R1], numberAtom(RemovedList, Tr).
