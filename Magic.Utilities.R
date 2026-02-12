
#function that does the magic: takes in starting card and returns the final card
magic.perform <- function(index, deck) {
     while (index < 52){
        index <- index + deck[[index]] #jumping down the card row
     }
    return (names(deck)[index]) #returning end card name
}


#function to set up cards, select players initial cards and compare players' final cards
magic.setup <- function(){


   deck.suit <- c("2"= 2, "3"=3, "4"=4,"5"= 5, "6"=6, "7"=7, "8"= 8, "9"= 9, "10"= 10, "A"=1, "K"=4, "Q"=4, "J" =4)

   deck.ace <- deck.suit
   names(deck.ace) <- paste0(names(deck.ace), "A")

   deck.spade <- deck.suit
   names(deck.spade) <- paste0(names(deck.spade), "S")

   deck.club <- deck.suit
   names(deck.club) <- paste0(names(deck.club), "C")

   deck.heart <- deck.suit
   names(deck.heart) <- paste0(names(deck.heart), "H")

   deck <- c(deck.ace, deck.spade, deck.club, deck.heart)

   print(deck) #sanity check

    deck.shuffled <- sample(deck)

    volunteer_index <- sample(1:10, 1)
    magician_index <- sample(1:10, 1)

    volunteer.card <- magic.perform(volunteer_index, deck.shuffled) #FIX THE FACT THAT 4 of K != 4 of Q
    magician.card <- magic.perform(volunteer_index, deck.shuffled)

    if (magician.card == volunteer.card){
        return (TRUE)
    }
    return (FALSE)
}
