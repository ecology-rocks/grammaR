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

makeNewDictionary <- function(writeme=FALSE, filename="", carryme=c(), carrydf=data.frame(key="", val="", stringsAsFactors=F), vectorPrint=""){
  if(vectorPrint==""){
    vectorPrint <- readline("Do you need this to build a dataframe or a file? Answer d/f.")
  }
  key <- readline("What is the key for this set of values? ")
  allrows <- as.numeric(readline("How many values are you entering? "))

  while(allrows < 1 | is.na(allrows)){
    allrows <- readline("Sorry, that was not a valid answer. How many values are you entering? ")
  }
   values <- c()
  for(i in 1:allrows){
    values <- c(values, readline("What is your value? "))
  }

  store <- buildEntry(key, values)
  storedf <- data.frame(key=key, val=values, stringsAsFactors=F)
  finaldf <- rbind(carrydf, storedf)
  final <- c(carryme, store)
  done <- readline("Are you done? y/n")
  if(done!="y" & done!="n"){
    done <- readLine("Sorry, that was not a valid answer. Are you done? Please enter y or n.")
  }
  if(done=="n"){
    makeNewDictionary(carryme=final, carrydf=finaldf, vectorPrint=vectorPrint)
  } else{
    if(writeme==FALSE){
      if(vectorPrint=="d"){
        finaldf <- finaldf[-1,]
        rownames(finaldf) <- 1:nrow(finaldf)
        return(finaldf)
      }
      return(final)
    }
  }


}


