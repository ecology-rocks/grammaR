
## pseudo code
##
## first split by ::=
## put those in a list [[1]] [[2]], key/val
## write individual words to file / write til you hit end of string or <
## if you hit <, parse out the value, look it up as key.
##      if it exists, parse down that tree.


#' New Grammar Parser
#'
#' @param filename The filename to run through the function.
#'
#' @examples
#' cat("top ::= <greeting> <place>!", "greeting ::= Hello | Howdy | Hey there | What's up", "place ::= fart <monkey>", "monkey ::= rawr | death | marquee", file="ex.data", sep="\n")
#' store <- readGrammar("ex.data")
#'
#' @export
readGrammar <- function(filename){
  require(stringr)
  x <- readLines(filename)
  mydic <- strsplit(x, " ::= ")
  mydic <- lapply(mydic, strsplit, split=" | ", fixed=T)
  returndf <- data.frame()
  for(i in 1:length(mydic)){
    tmpdf <- data.frame(key=unlist(mydic[[i]][1]), val=unlist(mydic[[i]][-1]), stringsAsFactors=F)
    returndf <- rbind(returndf, tmpdf)
  }
  return(returndf)
}

keyLookup <- function(mydic="", key="", runner=""){

  ## see if key is already bracketed, if not, then set it properly
  if(bracketXtract(key, "<")!="character(0)"){
    key <- unlist(bracketXtract(key, "<"))
  }
  val <- mydic[mydic$key==key,"val"]

  ## modify val so it's just one value
  if(length(val)<1) stop("badkey")

  if(length(val)>1){
    val <- val[round(runif(1, 1, length(val)))]
  }

  ## check for brackets
  if(bracketXtract(val, "<")=="character(0)"){
    return(val)
  } else{
    myBrackets <- unlist(bracketXtract(val, "<"))
    mykey <- paste("<", myBrackets, ">", sep="")
    for(i in 1:length(myBrackets)){
      val <- gsub(mykey[i], keyLookup(mydic, myBrackets[i]), val)
    }
    return(val)
  }
}



cat("top ::= <greeting> <place>!", "greeting ::= Hello | Howdy | Hey there | What's up", "place ::= fart <monkey>", "monkey ::= boner | death | marquee", file="ex.data", sep="\n")
store <- readGrammar("ex.data")



keyLookup(store, "top")

