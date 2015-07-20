#' Build a JSON File For Cover Images
#'
#' This is a function to build a JSON file if you're planning to use the generic
#' image creator built by NYPL labs, called "tenprintcover". I wrote it, but I
#' don't currently use it any longer, so I don't plan to support it if the file
#' needed changes.
#'
#' @param df The data.frame containing authors and titles.
#' @param returnme If true, returns the JSON string.
#' @param writeme If true, writes the JSON string to a file called "covers.json2" in a directory of your choice.
#' @param sdir The directory to put the covers file in if write=T
#' @param imagedir Set to "pngs/", the place where you want the transformed files.
#'
#'@note There are no tests for this function. It is not used.
#'
#' @export

buildJson <- function(df, returnme=FALSE, writeme=FALSE, sdir=".", imagedir="pngs/"){
  response <- vector()
  for(i in 1:nrow(df)){
    author <- df[i, "author"]
    title <- df[i, "title"]
    filenamestring <- makeCoverName(author, title)
    endstring <- paste("{\"authors\": \"", author,
                       "\", \"identifier\": \"", i,
                       "\", \"subtitle\": null,",
                       " \"title\": \"", title,
                       "\", \"identifier_type\": \"Batch ID\",",
                       " \"filename\": \"", imagedir, filenamestring,
                       "\"}", sep="", collapse="")
    response <- c(response, endstring)
  }
  if(writeme==TRUE){
    write(response, paste(sdir, "/", "covers.json2", sep=""))
  }
  if(returnme==TRUE){
    return(response)
  }

}
