## This is my test script for the package. I'm working in here so I don't have to leave the package editing tools.
##

getwd()
setwd("/Users/admin/GitHub/grammaR/inst/scripts")

library(grammaR)

## checking existing functions
##
## I know, it's a pain this way. But, I need them separate when I'm error
## checking.
mydic <- buildDictionary("inst/scripts/docs/decs-v.txt", T, T)
mydic <- rbind(mydic, buildDictionary("inst/scripts/docs/decs-n.txt", T, T))
mydic <- rbind(mydic, buildDictionary("inst/scripts/docs/decs-a.txt", T, T))
mydic <- rbind(mydic, buildDictionary("inst/scripts/docs/decs-t.txt", T, T))
mydic <- rbind(mydic, buildDictionary("inst/scripts/docs/decs-psim.txt", T, T))
mydic <- getUniques(mydic)


outfilenames <- c("c1.txt", "c2.txt", "c3.txt",
                  "c4.txt", "c5.txt", "c6.txt")
infilenames <- paste("/Users/admin/GitHub/grammaR/inst/scripts/docs/romance/", outfilenames, sep="")
outfilenames <- paste("/Users/admin/GitHub/grammaR/inst/scripts/docs/", outfilenames, sep="")
spinStory(infilenames, mydic, outfilenames)

## NOT TESTED, DONT RUN
##
for(i in 1:10){
  setwd("/Users/admin/GitHub/StoryBuilder/docs")
  ## rewrite a.txt
  generateCharacters()
  combineFiles(list.files(), paste("../outputs/071815run", i, ".gram", sep="", collapse=""))
  setwd("../outputs")
  createStory(paste("071815run", i, sep="", collapse=""), 1)

}
authordf <- getAuthorTitles()
buildJson(authordf)
setwd("../covers")
makeCommandsCovers(authordf)

## okay, so we can use imagemagick to make ebook covers. The workflow should be something like:
## for each author/title combo
## random pick image file in images directory
## Add additional modification? colorize, blur, etc...
## create new image in proper place with title/author combo
##
## batch convert to 600x900 in sdir:
## for f in *.jpg; do convert $f -resize 600x900! test/$f; done


