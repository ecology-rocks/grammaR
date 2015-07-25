makeGrammarFromStory <- function(intext, returnval="story"){
  mystory <- readLines(intext, n=-1)
  mystory <- mystory[nchar(mystory)>0]
  counter <- c("top ::= ")
  for(i in 1:length(mystory)){
    mystory[i] <- paste("paragraph", i, " ::= ", mystory[i], sep="")
    counter <- c(counter, paste("<paragraph", i, ">", sep=""))
  }
  if(returnval=="story"){
  return(mystory)
  } else{
    return(paste(counter, collapse=" <xParBreak> "))
  }

}
store <- makeGrammarFromStory("./cruise-original.txt")
head(store)
tail(store)
