#' Build A Recursive Story From Normal Text
#'
#'This function takes a list of infiles (infilenames), a dictionary, and a list of outfilenames. It will search each line of the infiles for possible trigger words in "val" column of "mydic", and substitute in the correct key value for those words.
#'
#'@param infilenames A list of input files, with appropriate file paths, to read into the program.
#'@param mydic A dictionary of keys and values to look up. Needs "key" and "val" columns. If there are repeat values, the first one only will be used by the program, and there will be no warning.
#'@param outfilenames A list of names for the resulting text. Good practice is to place into a separate folder instead of rewriting, in case something bad happens.
#'@param exec By default, this is FALSE. If TRUE, the program will write the resulting files to their intended places.
#' @return This function returns a list with the transformed story files. This may be a very, very large list, so be sure to execute this with a variable assignment.
#'
#'
#' @export


spinStory <- function(infilenames, mydic, outfilenames, exec=F){
  for(i in 1:length(infilenames)){
    finallist <- list()
    storylines <- readLines(infilenames[i], n=-1)

    for(j in 1:nrow(mydic)){
      storylines <- gsub(paste(" ", mydic[j, "val"], " ", sep=""), paste(" ", mydic[j, "key"], " ", sep=""), storylines, fixed=TRUE)
      storylines <- gsub(paste(" ", mydic[j, "val"], ".", sep=""), paste(" ", mydic[j, "key"], ".", sep=""), storylines, fixed=TRUE)
      storylines <- gsub(paste(" ", mydic[j, "val"], ",", sep=""), paste(" ", mydic[j, "key"], ",", sep=""), storylines, fixed=TRUE)
    }
    if(exec==T){
    writeLines(storylines, outfilenames[i])
    }
    finallist <- c(finallist, storylines)
  }
  return(finallist)
}
