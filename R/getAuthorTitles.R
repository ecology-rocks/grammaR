#' Extract Authors and Titles From LaTeX document
#'
#' This function extracts the first 250 characters of a document, which should
#' be the front matter (document start, title, author, chapter headings, in that
#' order). It takes anything contained within brackets. It eliminates things
#' that don't look like a title or author, like "document" and "Front Matter",
#' then returns a data.frame where every odd entry is the title, and every even
#' entry is the author. This is a pretty narrow function, but it serves its purpose.
#'
#' @param sdir The directory to process
#' @param filetype The type of file to process. Currently only supports .tex files.
#'
#' @return This function returns a data.frame with titles and authors for a directory of LaTeX documents.
#' @export

getAuthorTitles <- function(sdir=".", filetype="*.tex", filename=NULL){
  ##find all of the tex files in that path

  if(filetype=="*.tex"){
    if(length(filename)!=0){
      files <- filename
    }else{
        files <- list.files(path=sdir, pattern=filetype)
    }

    ## make sure there is at least one file.
        if(length(files)==0){
          stop("Sorry, no files found.")
        }
        if(sdir != "."){
          files <- paste(sdir, files, sep="/")
        }
        ## put all of the files into one big list
        objlist <- lapply(files, readLines)

        ## condense the list into smaller stuff, 1 per document
        objlist <- lapply(objlist, paste, collapse=" ")
        ## delist
        objlist <- as.vector(objlist)

        ## get the first 250 characters
        objlist <- lapply(objlist, substr, start=1, stop=250)

        ## extract all information from brackets
        final <- lapply(objlist, bracketXtract, br="{")

        ## put it into one long vector
        final <- unlist(final)

        ## get rid of "document" and "Front Matter"
        final <- final[final!="document"]
        final <- final[final!="Front Matter"]

        if(length(final) < 2){
          stop("Sorry, no title/author combinations were found.")
        }
        ## get total number of pairs
        authorcount <- length(final)
        ## get the odd # end for titles
        titlecount <- length(final) - 1

        if(authorcount > 2){
        ## make sequences for the authors and titles, subset appropriately
        authors <- final[seq(from=2, to=authorcount, by=2)]
        titles <- final[seq(from=1, to=titlecount, by=2)]
        } else{
        authors <- final[2]
        titles <- final[1]
      }
        returnme <- data.frame(title=titles, author=authors, stringsAsFactors=F)
        ## return final
    }## end tex if

  ## put other filetype algorithms here, when its time.
  ## Always end with a data.frame like returnme above.
  return(returnme)
}
