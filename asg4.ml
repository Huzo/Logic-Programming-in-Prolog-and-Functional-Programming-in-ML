datatype suit = Clubs | Diamonds | Hearts | Spades;
datatype rank = Jack | Queen | King | Ace | Num of int;
type card = suit * rank;

datatype color = Red | Black;
datatype move = Discard of card | Draw;

fun abs x = if x >= 0 then x else ~x;

fun cardColor(x:suit,y:rank):color = if x=Spades orelse x=Clubs then Black else Red;

fun cardValue(_,Jack) = 10
|   cardValue(_,Queen) = 10
|   cardValue(_,Ace) = 11
|   cardValue(_,King) = 10
|   cardValue(_,Num i) = i;

fun numOfCard(x:(suit*rank) list):int = length x;

fun removeCard(l:(suit*rank) list, s:suit, r:rank):(suit*rank) list =
        if (s,r) = hd(l) then tl(l)
        else [hd(l)]@removeCard(tl(l),s,r);

fun sumCards(l:(suit*rank) list, c:color):int =
        if null(l) then 0
        else if cardColor(hd(l)) = c then cardValue(hd(l)) + sumCards(tl(l),c)
        else sumCards(tl(l),c);

fun score(l:(suit*rank) list) = abs(sumCards(l,Red) - sumCards(l,Black)) + (6 - length(l));
