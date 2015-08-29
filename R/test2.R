parseGrammar <- function(mydic, topval="top", currentstring=""){

  ## if this isn't recursed, search for top val and execute
  stringToParse <- mydic[mydic$key==topval,"val"]

  ## make sure we only get one value
  if(length(stringToParse) < 1) stop("Sorry, no value was found")
  if(topval=="top"){
    if(length(stringToParse) > 1) stop("Sorry, not a unique value")

  } else{
    ## if there's more than one value, randomly select one for later
    if(length(stringToParse) > 1){
      stringToParse <- stringToParse[round(runif(1, 1, length(stringToParse)))]
    }
  }

  ## if there aren't any < or >, execute the string
  #print(stringToParse)
  checkForTerms <- unlist(bracketXtract(stringToParse, "<"))
  if(length(checkForTerms)==0){
    #print(checkForTerms)
    return(stringToParse)
  } else{
    ## for each bracketed term
    returnTerms <- checkForTerms
    for(i in 1:length(checkForTerms)){
      returnTerms[i] <- parseGrammar(mydic, checkForTerms[i])
      return(gsub(paste("<", checkForTerms[i], ">", sep=""), returnTerms[i], stringToParse, fixed=T))
    }
    ## time to reinsert

    #print(checkForTerms)
  }


}


cat("top ::= <greeting> <place>!", "greeting ::= Hello | Howdy | Hey there | What's up", "place ::= fart <monkey>", "monkey ::= boner", file="ex.data", sep="\n")
store <- readGrammar("ex.data")
rawr <- parseGrammar(store)
rawr
