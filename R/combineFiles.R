#' Combine All Files In A List
#'
#' This function combines all files in a given list and outputs them into one
#' file. It reads in the order that listfiles is received.
#'
#' @param listfiles The list of files to be read in. You can use "list.files()"
#'   to generate these.
#' @param outFileName The name of the file, including extension, that we want to
#'   write.
#' @param exec If true, the code will execute. If false, the code will print to
#'   a list.
#'
#' @return This function, if exec=FALSE, will return the expected output of the
#'   written outfile.
#' @export

combineFiles <- function (listfiles, outFileName, exec=TRUE){
  outfile <- file(outFileName, "w")
  response <- ""
  for(i in listfiles){
    x <- readLines(i)
    x <- gsub("NA", "", x, fixed=TRUE)
    if(exec==TRUE){
      writeLines(x[1:length(x)], outfile)
    } else{
      response <- c(response, x)
    }
  }## end loop
  ##close connection
  close(outfile)
  ##error check exec
  if(exec==FALSE){
    return(response)
  }
}
