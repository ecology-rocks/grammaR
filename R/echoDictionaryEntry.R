echoDictionaryEntry <- function(mydic, key="", val=""){
  if(key=="" & val==""){
    stop("Sorry, no keys or values to look up.")
  }

  if(key!=""){
    key <- paste("<", key, ">", sep="")
    vals <- mydic[mydic$key==key,"val"]
    return(vals)
  }
  if(val!=""){
    keys <- mydic[mydic$val==val, "key"]
    return(keys)
  }
}
