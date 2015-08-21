#' Trim Data.Frame To Unique Values Only
#'
#' This function is used to remove any rows in a data.frame with repeated
#' elements. It is necessary in grammaR because if we have two keys with the
#' value "said" in the dictionary, one will override the other when we do things
#' like spin a story up from plain text.
#'
#' @param df The data.frame to check; should have a column named "val" or a
#'   character value in "colname" parameter.
#' @param colname The name of the column to search and clean by.
#'
#' @return This function returns a data.frame with only unique values. It also
#'   removes any stray "|" symbols.
#'
#' @examples
#' ## removing uniques, cleaning out | symbols
#' sampleDf <- data.frame(key=c("<rubber>", "<joy>", "<hangar>"),
#'        val=c("farm", "farm", "toys |"), stringsAsFactors=F)
#'  getUniques(sampleDf)

#' @export
getUniques <- function(df, colname="val"){

  if(!is.data.frame(df)){
    stop("Sorry, df must be a data.frame")
  }

  if(!(colname %in% names(df))){
    stop("Sorry, your column is not named correctly.")
  }

  store <- df[!(duplicated(df[,colname]) |
                  duplicated(df[,colname], fromLast=TRUE)),]
  store <- store[nchar(store$val)>1,]
  vals <- gsub("|", "", store$val, fixed=TRUE)
  store$val <- vals
  rownames(store) <- 1:nrow(store)
  return(store)
}
