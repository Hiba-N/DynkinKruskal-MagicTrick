
source("Magic.Utilities.R")
args <- commandArgs(trailingOnly = TRUE)

runMagic <- function(count){

    magic_results <- rep(0, count)
    magic_results <- sapply(magic_results, magic.perform)

    results_summed <- sum(magic_results)
    results_percentage <- (results_summed/count)*100
    cat("The number of times the magician got the correct final card was", 
        results_summed, "out of", count, "or", results_percentage, "percent.", "\n")

}

if (length(args) != 1 || is.na(as.numeric(args[1]))) {
    cat("usage example: Rscript Magic.Analysis.R 35\n")
    quit()
    }

runMagic(as.numeric(args[[1]]))
