#' Make Lowercase And Dashed Image File Name
#'
#' This function takes an author and a title, extracts the alphanumeric
#' characters, mashes them together, makes them all lowercase, hyphenates them,
#' and adds ".png" to the end. So, "A Midsummer Night's Dream" by "Shakespeare"
#' would become "shakespeare-amidsummernightsdream.png". Enjoy!
#'
#' @param author The first string to modify, will show up first in the output.
#' @param title The second string to modify, will show up second in the output.
#'
#' @return This function returns a modified string.
#' @export
#'

makeCoverName <- function(author, title, extension=".jpg"){
  titlestring <- tolower(unlist(
    strsplit(gsub("[^[:alnum:] ]", "", title), " +")))
  titlestring <- paste(titlestring, collapse="", sep="")
  authorstring <- tolower(unlist(
    strsplit(gsub("[^[:alnum:] ]", "", author), " +")))
  authorstring <- paste(authorstring, collapse="", sep="")
  return(paste(authorstring, "-", titlestring, extension, sep=""))
}
