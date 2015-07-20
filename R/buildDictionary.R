#' Build Dictionary From Text Or File
#'
#' This function extracts keys/values from file or text and return key/values in data.frame

buildDictionary <- function(gramtext, readfile=TRUE, formatKey=TRUE){

  if(readfile==TRUE){
    ## read in file
    store <- readLines(gramtext, -1, skipNul = TRUE)
    ## get rid of empty lines
    store <- store[nchar(store)>0]
  } else{
    store <- gramtext
  }

  ## start response data.frame
  new.df <- data.frame(key="", val="", stringsAsFactors=F)

  ## for each line...
  for(i in 1:length(store)){

    beginning <- extractKey(store[i], formatKey)
    end <- extractValue(store[i])
    temp.df <- data.frame(key=beginning, val=end, stringsAsFactors=F)
    new.df <- rbind(new.df, temp.df)
  }
    ## return, clean up the first empty line.
    new.df <- new.df[-c(1),]
    ## rename rows for consistency
    rownames(new.df) <- 1:nrow(new.df)
    return(new.df)
}
