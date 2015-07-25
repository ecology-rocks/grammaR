writeDictionary <- function(mydic, exec=FALSE, outfilename=""){
  uniquekeys <- unique(mydic$key)
  uniqueclean <- gsub("<", "", uniquekeys)
  uniqueclean <- gsub(">", "", uniqueclean)
  response <- c()
  for(i in 1:length(uniqueclean)){
    myvals <- mydic[mydic$key==uniquekeys[i], "val"]
    myvals <- paste(myvals, collapse=" | ")
    response <- c(response, paste(uniqueclean[i], " ::= ", myvals, sep=""))
  }
  if(exec==TRUE){
    writeLines(sort(response), outfilename)
  }
  return(response)
}
