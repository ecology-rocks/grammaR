#' Parse a grammar based on recursion
#'
#'
#' @param mydic The dictionary to use for parsing.
#' @param key The key to look up
#'
#' @examples
#' #' cat("top ::= <greeting> <place>!", "greeting ::= Hello | Howdy | Hey there | What's up", "place ::= fart <monkey>", "monkey ::= rawr | death | marquee", file="ex.data", sep="\n")
#' store <- readGrammar("ex.data")
#' parseGrammar(store, "top")
#' @export
parseGrammar <- function(mydic="", key=""){

  ## see if key is already bracketed, if not, then set it properly
  if(bracketXtract(key, "<")!="character(0)"){
    key <- unlist(bracketXtract(key, "<"))
  }
  val <- mydic[mydic$key==key,"val"]

  ## modify val so it's just one value
  message <- paste("bad key ", key, sep="")
  if(length(val)<1) stop(message)

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
      val <- gsub(mykey[i], parseGrammar(mydic, myBrackets[i]), val)
    }
    return(val)
  }
}
