#' Print All Dictionary Entries Associated With a Particular Value
#'
#' This function returns the values or keys associated with the opposite value entered, e.g., if you enter a key, the function will return all of its values, and vice versa.
#'
#' @param mydic A data.frame with columns "key" and "val"
#' @param key A search value for the "key" column
#' @param val A search value for the "val" column
#'
#' @return This function returns a vector of response values
#'
#' @examples
#' testdic <- data.frame(key=c("<key1>", "<key2>"), val=c("a", "b"), stringsAsFactors=F)
#' echoDictionaryEntry(testdic, "key1")
#'
#' @export

echoDictionaryEntry <- function(mydic, key="", val=""){
  if(key=="" & val==""){
    stop("Sorry, no keys or values to look up.")
  }

  if(key!=""){
    key <- paste("<", key, ">", sep="")
    vals <- mydic[mydic$key==key,"val"]
    return(vals)
  }
  if(val!=""){
    keys <- mydic[mydic$val==val, "key"]
    return(keys)
  }
}
