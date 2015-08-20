### R code from vignette source 'grammaRmanual.Rnw'

###################################################
### code chunk number 1: grammaRmanual.Rnw:73-79
###################################################
## load library
library(grammaR)
## build dictionary from string
myDic <- buildDictionary("rawr ::= space | magic", readfile=F, formatKey=T)
## show dictionary
myDic


###################################################
### code chunk number 2: grammaRmanual.Rnw:83-94
###################################################
## create a text file with 2 lines with dictionary values
  cat("rawr ::= 1 | 2",
      "boo ::= a | b",
      file="ex.txt",
      sep="\n")
## read them into R
myDic <- buildDictionary("ex.txt", TRUE)
## show results
myDic
## delete text file
unlink("ex.txt")


###################################################
### code chunk number 3: grammaRmanual.Rnw:98-115
###################################################
# store <- makeNewDictionary()
#  > Do you need this to build a dataframe or a file? Answer d/f.
#  d
#  > What is the key for this set of values?
#  rawr
#  > How many values are you entering?
#  2
#  > What is your value?
#  osaurus
#  > What is your value?
#  rex
#  > Are you done?
#  y
#  store
#   >    key     val
#   > 1 rawr osaurus
#   > 2 rawr     rex


###################################################
### code chunk number 4: grammaRmanual.Rnw:123-129
###################################################
## create duplicates in values in myDic
 myDic[,2] <- c("Arbys", "McDonalds", "McDonalds", "Burger King")
## show dictionary
myDic
## show getUniques function
getUniques(myDic)


###################################################
### code chunk number 5: grammaRmanual.Rnw:135-146
###################################################
## reassign for example
  myDic[,2] <- c("apples", "<rawr>", "bananas", "broccoli")
## find the first character of "val" column
## and put it in a new column named "clean"
  myDic$clean <- substr(myDic$val,1,1)
## remove any rows where the "clean" column contains <
  myDic <- myDic[-which(myDic$clean=="<"),]
## delete the clean column
  myDic <- myDic[,-3]
## show results
  myDic


###################################################
### code chunk number 6: grammaRmanual.Rnw:153-161
###################################################
  ## story file
cat("A man walks into a bar and steps on a bug.", "",
    file="a.txt", sep="\n")
  ## dictionary file
 myDic <- buildDictionary("character ::= man | woman | alien | horse", F)
 ## bind the old mDic to a new myDic entry
 myDic <- rbind(myDic, buildDictionary("place ::= bar | restaurant | home | lake", F))
 myDic


###################################################
### code chunk number 7: grammaRmanual.Rnw:166-168
###################################################
  ## make list of file names
  spinStory("a.txt", myDic, "test.txt", exec=F)


###################################################
### code chunk number 8: grammaRmanual.Rnw:174-176
###################################################
# install.packages("randomNames")
 library(randomNames)


###################################################
### code chunk number 9: grammaRmanual.Rnw:181-183
###################################################
generateCharacters("mainChar", "F")
generateCharacters(c("char1", "char2"), c("f", "m"), writefile=T, outfilename="char.txt")


###################################################
### code chunk number 10: grammaRmanual.Rnw:192-207
###################################################
## your first file, read in alphabetically,
## will be the starting point of the program
cat("start ::= My Story <linebreak> Sam Davis <linebreak> <story>",
    "linebreak ::= \\n",
    file="a.txt", sep="\n")
cat("story ::= Once upon a time, <char1> kissed <char2>",
    file="b.txt", sep="\n")

## char.txt already got generated with
## the values of <char1> and <char2> inside.
myFiles <- list.files(pattern=".txt")
myFiles
combineFiles(myFiles, "myStory.gram")
## show the file
readLines("myStory.gram")


###################################################
### code chunk number 11: grammaRmanual.Rnw:212-214
###################################################
createStory("myStory")
readLines("myStory-1.tex")


###################################################
### code chunk number 12: grammaRmanual.Rnw:219-228
###################################################
for(i in 1:10){
  generateCharacters(c("char1", "char2"),
                     c("f", "m"),
                     writefile=T,
                     outfilename="char.txt")
  combineFiles(list.files(pattern=".txt"), "myStory.gram")
  createStory("myStory", 1)
 print(readLines("myStory-1.tex"))
}


###################################################
### code chunk number 13: grammaRmanual.Rnw:238-251
###################################################
cat("\\begin{document}",
    "\\title{My Cool Story}",
    "\\author{Mr. McAwesome}",
    "\\maketile",
    "\\chapter{The Start}",
    "Once upon a time, there was a girl, and she was awesome.",
    "\\end{document}",
    file="test.tex", sep="\n"
    )

authordf <- getAuthorTitles(filename="test.tex")
authordf
str(authordf)


###################################################
### code chunk number 14: grammaRmanual.Rnw:256-259
###################################################
makeCommandsCovers(authordf, stockdir="./", exec=T)

## use ?makeCommandsCovers to check out where your files belong.


###################################################
### code chunk number 15: grammaRmanual.Rnw:272-278
###################################################

store <- makePandocCommand(authordf, filename="test.tex")

## execute store using the system command to generate an epub.
#   system(store)



