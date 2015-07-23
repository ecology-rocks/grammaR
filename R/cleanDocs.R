#' Clean NA out of files before compiling

cleanDocs <- function(){
  listoffiles <- list.files(pattern=".tex")
  for(i in 1:length(listoffiles)){
    x <- readLines(listoffiles[i])
    x <- gsub("NA", "", x, fixed=TRUE)
    writeLines(x[1:length(x)], listoffiles[i])
  }
}
