#' Make a basic grammar for your story from a plain text file.
#'
#' This function takes a text file, "intext", and returns either a full grammar separated by paragraph.
#'
#' @param intext The file path to read from.
#'
#' @return This function returns a vector of character strings representing individual lines of your grammar. You will need to write them into a new file separately.
#'
#' @export

makeGrammarFromStory <- function(intext){
  mystory <- readLines(intext, n=-1)
  mystory <- mystory[nchar(mystory)>0]
  counter <- c("top ::= ")
  for(i in 1:length(mystory)){
    mystory[i] <- paste("paragraph", i, " ::= ", mystory[i], sep="")
    counter <- c(counter, paste("<paragraph", i, ">", sep=""))
  }
  finalcounter <- paste(counter, collapse=" <xParBreak> ")
  final <- c(counter, mystory)

}
