#' This Function Cleans NA From Files Before Compiling
#'
#' This simple function gets all possible .tex files in the current working
#' directory and removes all "NA" from them, which is a side effect of some of
#' the other scripts.
#'
#' @param myPattern The type of pattern to look for, e.g., .tex
#'
#' @return This function does not have an output, but overwrites files in the
#'   current working directory. BE CAREFUL!
#'
#' @export

cleanDocs <- function(myPattern=".text"){
  listoffiles <- list.files(pattern=myPattern)
  for(i in 1:length(listoffiles)){
    x <- readLines(listoffiles[i])
    x <- gsub("NA", "", x, fixed=TRUE)
    writeLines(x[1:length(x)], listoffiles[i])
  }
}
