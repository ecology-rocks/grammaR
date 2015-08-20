#' Making Pandoc Execs
#' @export

makePandocCommand <- function(authordf, filename="", exec=F){
  if(nchar(filename) > 0){
      listoffiles <- filename
  } else{
      listoffiles <- list.files(pattern="*.tex")
  }
  response <- c()
  for(i in 1:length(listoffiles)){
    author <- authordf[i, "author"]
    title <- authordf[i, "title"]
    epubname <- makeCoverName(author, title, extension=".epub")
    jpgname <- makeCoverName(author, title)
    command <- paste("pandoc -o epubs/", epubname, " ", listoffiles[i], " --epub-cover-image=../covers/", jpgname, sep="")
    response <- c(response, command)
  }
  ##pandoc -o epubs/sarahjfisher-tenderwithchristian.epub 072215run1-1.tex --epub-cover-image=../covers/sarahjfisher-tenderwithchristian.jpg
  return(response)
}

