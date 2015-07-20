#' Generate Character Names By Gender
#'
#' This function generates character first names by gender. It requires the
#' randomNames package.
#'
#' @param charnames A vector of keys to use for the characters, e.g., cFemName
#' @param chargenders A vector of "M" or "F", representing male or female.
#' @param whichnames Default is first, set to last or both to change the output
#'   string
#' @param writefile If set to true, this function will write a file.
#' @param outname The directory and name of file that we should write if
#'   writefile=TRUE
#'
#' @return This function returns the value of the file that it will write.
#'
#' @export

generateCharacters <- function(charnames=c("cFemName", "cMaleName", "cFriendName", "cPetName"), chargenders=c("F", "M", "F", "M"), whichnames="first", writefile=FALSE, outname="aNames.txt"){
  require(randomNames)
  ## only if genders and characters match...
  middlematter <- ""
  ## if there are equal entries in charnames and char genders
  if(length(charnames)==length(chargenders)){

    for(i in 1:length(charnames)){
      store <- NULL
      store <- paste(charnames[i],
                     " ::= ",
                     randomNames(1,
                                 chargenders[i],
                                 which.names=whichnames),
                     " \n ",
                     sep="",
                     collapse="")
      middlematter <- paste(middlematter, store, sep="", collapse="")

    }
  }else{
    stop("Sorry, your input vectors do not have the same length.")
  }

  if(writefile==TRUE){
    write(middlematter, outname)
  }
  return(middlematter)
}
