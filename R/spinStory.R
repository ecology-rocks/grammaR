#' Build A Recursive Story From Normal Text
#'
#' @export


spinStory <- function(infilenames, uniques, outfilenames){
  for(i in 1:length(infilenames)){
    storylines <- readLines(infilenames[i], n=-1)

    for(j in 1:nrow(uniques)){
      storylines <- gsub(paste(" ", uniques[j, "val"], " ", sep=""), paste(" ", uniques[j, "key"], " ", sep=""), storylines, fixed=TRUE)
      storylines <- gsub(paste(" ", uniques[j, "val"], ".", sep=""), paste(" ", uniques[j, "key"], ".", sep=""), storylines, fixed=TRUE)
      storylines <- gsub(paste(" ", uniques[j, "val"], ",", sep=""), paste(" ", uniques[j, "key"], ",", sep=""), storylines, fixed=TRUE)
    }
    writeLines(storylines, outfilenames[i])

  }
}
