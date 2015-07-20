#' Extract A Key From The Dictionary
#'
#' A function to extract keys from the unique dictionary syntax, which goes key
#' ::= val1 | val2 | etc..., and put it in its proper format.
#'
#' @param inString A string to be formatted.
#' @param format If set to TRUE (default), then <> are added around the word for
#'   insertion into a story.
#' @return This function returns the modified string.


extractKey <- function(inString, format=TRUE){
  if(nchar(inString)<1){
    stop("Error: inString is NULL.")
  }
  if(!is.numeric(inString) & !is.character(inString)){
    stop("Error: inString is not a character or numeric string.")
  }

  beginning <- trimws(gsub("::=.*", "", inString))
  if(format==TRUE){
  beginning <- paste("<", beginning, ">", sep="")
  }
  return(beginning)
}
