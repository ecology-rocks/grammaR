## This is my test script for the package. I'm working in here so I don't have to leave the package editing tools.
##

getwd()


library(grammaR)

## checking existing functions
##
## I know, it's a pain this way. But, I need them separate when I'm error
## checking.
setwd("/Users/admin/GitHub/grammaR/inst/scripts")
mydic <- buildDictionary("docs/decs-v.txt", T, T)
mydic <- rbind(mydic, buildDictionary("docs/decs-n.txt", T, T))
mydic <- rbind(mydic, buildDictionary("docs/decs-a.txt", T, T))
mydic <- rbind(mydic, buildDictionary("docs/decs-psim.txt", T, T))
mydic <- getUniques(mydic)
mydic$clean <- substr(mydic$val,1,1)
mydic <- mydic[-which(mydic$clean=="<"),]
outfilenames <- c("c0frontmatter.txt", "c1.txt", "c2.txt", "c3.txt",
                  "c4.txt", "c5.txt", "c6.txt")
infilenames <- paste("/Users/admin/GitHub/grammaR/inst/scripts/docs/romance/", outfilenames, sep="")
outfilenames <- paste("/Users/admin/GitHub/grammaR/inst/scripts/docs/", outfilenames, sep="")
spinStory(infilenames, mydic, outfilenames)

## NOT TESTED, DONT RUN
##
for(i in 1:25){
  setwd("/Users/admin/GitHub/grammaR/inst/scripts/docs")
  ## rewrite a.txt
  generateCharacters(writefile=TRUE, outname="aNames.txt")
  combineFiles(list.files(), paste("../outputs/072215run", i, ".gram", sep="", collapse=""))
  setwd("../outputs")
  createStory(paste("072215run", i, sep="", collapse=""), 1)
}

authordf <- getAuthorTitles()
#buildJson(authordf)
setwd("../covers")
makeCommandsCovers(authordf, exec=TRUE)
setwd("../outputs")
store <- makePandocCommand(authordf)
for(i in 1:length(store)){
  system(store[i])
}
## okay, so we can use imagemagick to make ebook covers. The workflow should be something like:
## for each author/title combo
## random pick image file in images directory
## Add additional modification? colorize, blur, etc...
## create new image in proper place with title/author combo
##
## batch convert to 600x900 in sdir:
## for f in *.jpg; do convert $f -resize 600x900! test/$f; done


########## Ok, let's build a story from scratch!
setwd("/Users/admin/Desktop/testBooks")
cruise <- makeGrammarFromStory("cruise-original.txt")
top <- makeGrammarFromStory("cruise-original.txt", "counter")
finalgrammar <- c(top, cruise)
writeLines(cruise, con="cruisestory.gram")

mydic <- buildDictionary("docs/decs-v.txt", T, T)
mydic <- rbind(mydic, buildDictionary("docs/decs-n.txt", T, T))
mydic <- rbind(mydic, buildDictionary("docs/decs-a.txt", T, T))
mydic <- rbind(mydic, buildDictionary("docs/decs-psim.txt", T, T))
mydic <- getUniques(mydic)
mydic$clean <- substr(mydic$val,1,1)
mydic <- mydic[-which(mydic$clean=="<"),]

infilenames <- "/Users/admin/Desktop/testBooks/cruisestory.gram"
outfilenames <- "/Users/admin/Desktop/testBooks/out-cruisestory.gram"
spinStory(infilenames, mydic, outfilenames)
