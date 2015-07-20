#' Interactive: Make A New Dictionary
#'
#' This is an interactive function that will help you build a dictionary. The writeme functionality is currently NOT implemented.
#'
#' @param writeme When active, this parameter should let you write to a file.
#' @param filename The file to write to, when writeme works.
#' @param carryme This is a vector of other lines to include in the file. It gets carried recursively through the function.
#'
#' @return This function returns a vector of key::=vals dictionary entries.
#'
#' @export

makeNewDictionary <- function(writeme=FALSE, filename="", carryme=c()){
  key <- readline("What is the key for this set of values? ")
  allrows <- readline("How many values are you entering? ")

  if(allrows < 1){
    allrows <- readline("Sorry, that was not a valid answer. How many values are you entering? ")
  }
   values <- c()
  for(i in 1:allrows){
    values <- c(values, readline("What is your value? "))
  }

  store <- buildEntry(key, values)
  final <- c(carryme, store)
  done <- readline("Are you done? y/n")
  if(done!="y" & done!="n"){
    done <- readLine("Sorry, that was not a valid answer. Are you done? Please enter y or n.")
  }
  if(done=="n"){
    makeNewDictionary(carryme=final)
  } else{
    if(writeme==FALSE){
      return(final)
    }
  }


}


