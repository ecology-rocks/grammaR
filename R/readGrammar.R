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
