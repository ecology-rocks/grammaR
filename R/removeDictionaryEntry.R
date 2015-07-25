#' Remove An Entry From A Dictionary Data.Frame
#'
#' This function searches by key or val and removes any dictionary entries associated with those values. It will process the "key" before the "val", not that that should matter. Warning: This function will remove any blank entries, if you have them.
#'
#'@param mydic A data.frame containing a column "key" and a column "val". "key", in particular, should be formatted with < and > surrounding any key name.
#'@param key Initially left "", setting this will let the function search in the key column for any matching value to remove.
#'@param val Initially left "", setting this will let the function search in the val column for any matching value to remove.
#'
#'@examples
#'mydic <- data.frame(key=c("<tigers>", "<tigers>", "<lions>", "<lions>"), val=c("a", "b", "c", "d"), stringsAsFactors=F)
#'removeDictionaryEntry(mydic, key="tigers")
#'removeDictionaryEntry(mydic, val="b")
#'@export

removeDictionaryEntry <- function(mydic, key="", val=""){
  if(key=="" & val==""){
    stop("Sorry, no keys or values to look up.")
  }
    key <- paste("<", key, ">", sep="")
    subsetted <- mydic[mydic$key!=key,]
    subsetted <- subsetted[subsetted$val!=val,]
    rownames(subsetted) <- 1:nrow(subsetted)
    return(subsetted)
}
