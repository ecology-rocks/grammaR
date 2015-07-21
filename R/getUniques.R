#' Trim Data.Frame To Unique Values Only
#'
#' This function removes all entries with a repeated value.
#'
#' @param df The data.frame to check; should have a column named "val" -- that's the unique column.
#' @return This function returns a data.frame with only unique values. It also should remove any stray "|" symbols.
#' @export
getUniques <- function(df){
  store <- df[!(duplicated(df[,"val"]) |
                  duplicated(df[,"val"], fromLast=TRUE)),]
  store <- store[nchar(store$val)>1,]
  vals <- gsub("|", "", store$val, fixed=TRUE)
  store$val <- vals
  return(store)
}
