#' Extract A Set Of Values From The Dictionary
#'
#' A function to extract values from the unique dictionary syntax, which goes
#' key ::= val1 | val2 | etc..., and put it in its proper format, which is
#' individual members of a vector. See the complementary functions
#' \code{\link{extractKey}} and the opposite function \code{\link{buildEntry}}
#' for other options.
#'
#' @param inString A string to be formatted.
#' @param format If set to TRUE (default), then the string is split into
#'   individual members by | before being returned.
#' @return This function returns the modified string.
#'
#' @examples
#' extractValue("rawr ::= a | b | c", format=TRUE)
#' @export



extractValue <- function(inString, format=TRUE){

  if(nchar(inString)<1){
    stop("Error: inString is NULL.")
  }
  if(!is.numeric(inString) & !is.character(inString)){
    stop("Error: inString is not a character or numeric string.")
  }


  end <- trimws(gsub(".*::=", "", inString))


  if(format==TRUE){
    end <- unlist(strsplit(end, " | ", fixed=TRUE))
  }
  return(end)
}
