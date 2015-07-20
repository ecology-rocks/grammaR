#' Build Entry From Key And Values
#'
#' The tiniest function ever to build a key value entry. It is essentially the
#' opposite of extractKey and extract Value.
#'
#' @param key A string with the key value inside.
#' @param values A vector of strings with the values.
#'
#' @return This function returns your new string.
#' @export

buildEntry <- function(key, values){
  end <- paste(key, " ::= ", paste(values, collapse=" | "), sep="")
  return(end)
}
