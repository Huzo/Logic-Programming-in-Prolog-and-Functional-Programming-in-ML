# Logic Programming in Prolog and Functional Programming in ML
## CSCI3180 – Principles of Programming Languages – Spring 2019

```
Assignment 4 — Declarative Programming
```
# 1 Introduction

Declarative programming is a programming paradigm that expresses the logic of a computation
without describing its control flow. You will gain experience of declarative programming with an
emphasis on Prolog and ML in this assignment.

# 2 Logic Programming

Implement the required predicates or queries of the following two problems in a Prolog program file
named “asg4.pl”. You should clearly indicate using comments the corresponding question number
of each sub-problem. Note that the answers which are queries should be written in comments as
well.

1. Recall the successor notation for representing natural numbers, and thesum(X,Y,Z)relation
    defined in the lecture which is true ifZis the sum ofXandY.

```
(a) DefinenatNum(X)which is true ifXis a natural number.
(b) Definelt(X,Y)which is true ifXis less thanY.
(c) Give a query to find natural numbers less than 3.
(d) Definegeq(X,Y)which is true ifXis equal to or greater thanY.
(e) Definemax(X,Y,Z)which is true ifZis the maximum ofXandY.
(f) Based onsum/3, definedifference(X,Y,Z)which is true ifXminusYis equal toZ.
(g) Based onlt/2,geq/2anddifference/3, definemod(X,Y,Z)which is true ifXmodY
is equal toZ.
```
2. Abinary tree is either empty or composed of a root and two children, which are binary
    trees themselves. The root of a binary tree is a node containing a value. Diagramatically, a
    binary tree consists of a set ofnodesand lines connecting parents and children. The nodes
    are depicted by circles with values written inside. Empty binary trees are not shown in the
    diagram.

```
Figure 1: An example of binary tree
```
```
In Prolog, we represent an empty tree by the atom “nil” and a non-empty tree by the term
“bt(X,L,R)”, whereXdenotes the root node,LandRdenote the left and right subtrees
respectively.
```

```
(a) Represent the binary tree shown in Figure 1 as a Prolog term.
(b) Define the predicateisTree(Term), where “Term” can be any Prolog term. Predicate
isTree(Term)is true if “Term” represents a binary tree.
(c) Define the predicateisLeaf(X,Tree), where “X” is a tree node, “Tree” is a binary tree.
A leaf is a node with no children. PredicateisLeaf(X,Tree)is true if “X” is a leaf node
of the given “Tree”.
(d) Define the predicatenumberOfLeaf(Tree,N), where “Tree” is a binary tree, “N” is the
number of leaf nodes in thesuccessor notation. Note that you could use thesum/
defined previously.
(e) Theheightof a binary tree is the length of the path from the root to the deepest leaf
node (with both children as empty) in the tree. Here we define the height of an empty
tree to be zero. Thus a tree with a single element node (with both children as empty)
will have a height of one (s(0)), and so on. Define the predicateheight(Tree,H),
where “Tree” is a term representing a binary tree and H is the height of this tree in the
successor notation. You may want to use themax/3defined above.
```
# 3 Functional Programming

Implement the required functions of the following problem in an ML program file named “asg4.ml”.
You should clearly indicate using comments the corresponding question number of each sub-
problem.
This problem involves a card game invented just for this question. You will write several helper
functions first and then implement a main program to track the progress of this game. The card
game is played with acard-list, and the player will have a list ofheld-cards, initially empty. During
each round of play, the player makes a move by choosing to draw a card from thecard-list, or
discarding one of theheld-cards. The game will end either when the player chooses to stop or when
the player already has six cards.
The goal of this game is to end the game with a low score (0 is the best). The score is defined
as the absolute value of the differences between sum of the red color card values and the sum of
black color card values, and then plus six minuses the number of held cards. The details are shown
in the following formula:

```
Score=abs(sum(redvalues)−sum(blackvalues)) + (6−#heldcards).
```
The type definition of a card is shown below (The joker cards are not included in this game):

```
datatype suit = Clubs | Diamonds | Hearts | Spades;
datatype rank = Jack | Queen | King | Ace | Num of int;
type card = suit * rank;
```
Each card will have associated suit and rank. The suit of a card is related to the color and rank
is related to the value of the card. The color type and move type are defined as

```
datatype color = Red | Black;
datatype move = Discard of card | Draw;
```
1. Write an ML functionabs, which takes an integer and returns its absolute value.
2. Write an ML functioncardColor, which takes a card as input and returns its color. Spades
    and clubs are black, while diamonds and hearts are red. Note that one case-expression is
    enough.
3. Write an ML functioncardValue, which takes a card as input and returns its value. Num-
    bered cards have their numbers as the value. Aces are 11, and everything else is 10.


4. Write an ML functionnumOfCard, which takes a card listcardListand returns the number
    of cards in the list.
5. Write an ML functionremoveCard(cardList, c), which takes a card listcardListrepre-
    senting the held-cards, and a cardc. It should return a list after removing cardcfrom the
    list. If c is in the list more than once, remove only the first one. You could assume thatcis
    always contained in the list. Note that “=” can be used to compare cards.
6. Write an ML functionsumCards(cardList, col), which takes a list of cardscardListand
    a colorcol. It will return the sum of the given color card values.
7. Write an ML functionscore, which takes a card listcardList(the held-cards) and computes
    the score as defined earlier.
8. Write an ML functionrunGame(cardList, moveList), which takes a card listcardList
    representing the cards from which the player can draw, a move listmoveList(the moves
    chosen by the player at each round of play), and returns the score at the end of the game
    after processing the moves in the move list in order. As described above:
       - At the beginning of the game, the list representing held-cards should be empty.
       - If there are no more moves (i.e. the move list is empty), the game will end.
       - During each round of play, if the player choose to discard some cardc, the game will
          continue with the held-cards havingcremoved and the card list remains unchanged.
       - If a player chooses to draw a card and the card list is already empty, the game is
          over. If drawing causes the number of the held-cards to exceed five, the game is over
          (after drawing). Otherwise, the game continues with a larger held-cards and a smaller
          card-list.
