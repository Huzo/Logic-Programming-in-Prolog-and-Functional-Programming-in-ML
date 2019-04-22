datatype suit = Clubs | Diamonds | Hearts | Spades;
datatype rank = Jack | Queen | King | Ace | Num of int;
type card = suit * rank;

datatype color = Red | Black;
datatype move = Discard of card | Draw;

fun abs x = if x >= 0 then x else ~x;

fun cardColor(x:suit,y:rank):color = if x=Spades orelse x=Clubs then Black else Red;

fun cardValue(x:suit,y:rank):int = if y=Ace then 11 else 10;

fun numOfCard(x:(suit*rank) list):int = length x;

