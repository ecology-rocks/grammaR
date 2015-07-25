removeDictionaryEntry <- function(mydic, key="", val=""){
  if(key=="" & val==""){
    stop("Sorry, no keys or values to look up.")
  }
    key <- paste("<", key, ">", sep="")
    subsetted <- mydic[mydic$key!=key,]
    subsetted <- subsetted[subsetted$val!=val,]
    rownames(subsetted) <- 1:nrow(subsetted)
    return(subsetted)
}
