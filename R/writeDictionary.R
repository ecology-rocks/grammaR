#' Write Dictionary From Data.Frame To File
#'
#' This function writes a text file based on an existing data.frame with "key" and "val" columns inside it.
#'
#' @param mydic A data.frame containg "key" and "val" columns
#' @param exec If set to TRUE, the function will write to file at outfilename.
#' @param outfilename The name and path of the file you want to write, e.g., "./test.gram"
#'
#' @return This function will always return its output, regardless of whether or not exec is set to TRUE.
#'
#' @examples
#' testdic <- data.frame(key=c("key1", "key2"), val=c("a", "b"), stringsAsFactors=F)
#' writeDictionary(testdic)
#' @export

writeDictionary <- function(mydic, exec=FALSE, outfilename=""){
  uniquekeys <- unique(mydic$key)
  uniqueclean <- gsub("<", "", uniquekeys)
  uniqueclean <- gsub(">", "", uniqueclean)
  response <- c()
  for(i in 1:length(uniqueclean)){
    myvals <- mydic[mydic$key==uniquekeys[i], "val"]
    myvals <- paste(myvals, collapse=" | ")
    response <- c(response, buildEntry(uniqueclean[i], myvals))
  }
  if(exec==TRUE){
    writeLines(sort(response), outfilename)
  }
  return(response)
}
