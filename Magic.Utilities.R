# # # 1) Create a file named Magic.Utilities.R containing the following functions.

# # # 1a) Write a function which will take as an argument, at a minimum, 
# # the starting card of the trick. The function will play the game, and then return either 
# # the index or a string describing the last card that was found.


#function that does the magic: takes in starting card and returns the final card
magic.perform <- function(index, deck) {
     while(index < 52){
        index <- index + deck[[index]]
     }
    return (deck[[index]])
}


#function to set up cards, select players initial cards and compare players' final cards
magic.setup <- function(){

    deck <- c(rep(c(4, 4, 4, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), each = 4)) #all cards in the deck
    #print(magic.deck) #sanity check

    #SHUFFLE THE CARDS FOR GODS SAKE

    volunteer_index <- sample(1:10, 1)
    magician_index <- sample(1:10, 1)

    volunteer.card <- magic.perform(volunteer_index, deck) #FIX THE FACT THAT 4 of K != 4 of Q
    magician.card <- magic.perform(volunteer_index, deck)

    if (magician.card == volunteer.card){
        return (TRUE)
    }
    return (FALSE)
}
