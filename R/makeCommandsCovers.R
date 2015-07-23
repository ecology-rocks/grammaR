#' Generate Covers With ImageMagick
#'
#' This function executes ImageMagick commands to generate covers. It is a
#' complex function.
#'
#' @param df The author/title dataframe that we'll loop through.
#' @param sdir The working directory, we need to be in this directory to perform
#'   ImageMagick functions. It is much easier to set now than screw with path
#'   later.
#' @param odir The out directory. As in, where you want your new files to go.
#' @param stockdir The directory that leads to the stock images that we'll be working with.
#' @param exec Set to false; set to true will attempt to execute the commands in the system() interface.
#'
#' @note If exec=TRUE breaks/crashes R, you may need to make sure that R can find ImageMagick, and can also find ghostscript. The easiest way, on a Mac, is to use MacPorts. Install ImageMagick; if it doesn't work, install ghostscript. Consult the internet.
#' @export
#'

makeCommandsCovers <- function(df, sdir="./", odir="./", stockdir="originals/", exec=FALSE){
  setwd(sdir)
  ##for each author/title combo...

  response <- ""

  for(i in 1:nrow(df)){
    ## pull out author and title for easy access, make the end filename
      author <- df[i, "author"]
      title <- df[i, "title"]
      filestring <- makeCoverName(author, title)

    ## get all possible cover bases
      listofcovers <- list.files(path=stockdir, pattern="*.jpg")
      if(length(listofcovers)==0){
        stop("Sorry, there are no images in your stock directory.")
      }
    ## sample one cover from the list
      chosencover <- sample(listofcovers, 1)
    ## get a filename for it.
      chosencover <- paste(stockdir, chosencover, sep="")

    ## do a coin flip for colorize options
    colorizeopts <- ""
    colorizetest <- sample(c(0,1), 1)

    ## if coinflip was "yes", make a colorize string.
    if(colorizetest==1){
      randomizedtint <- sample(1:3, 1)
      if(randomizedtint==1){
        colorizeopts <- paste("-colorize ",
                              sample(0:255, 1), ",0,0",
                              sep="")
      }
      if(randomizedtint==2){
        colorizeopts <- paste("-colorize ",
                              "0,", sample(0:255, 1), ",0",
                              sep="")
      }
      if(randomizedtint==3){
        colorizeopts <- paste("-colorize ",
                              "0,0,", sample(0:255, 1),
                              sep="")
      }

    } ## end colorize if



##This command is as follows: Make a mostly black background. Set the font
##to color white. Center the text. Make the fontsize 48. Make the image
##space for the caption 600x150. Write the author caption. Add chosen stock
##cover to the stack. Add the option of colorizing. Move the caption box
##south. Flatten the layers. Export to filestring.
##

    buildAuthorCommand <- paste("convert -background '#0008' -fill white -gravity center -pointsize 48 -size 600x150 caption:\"", author, "\" ", chosencover, " ", colorizeopts, " +swap -gravity south -composite ", filestring, sep="")


## This command is as follows: Make the dark background. Set the font to white.
## Center the text. Make the font size 72. Make it a 600x150 box. Write the
## title. Import filestring. Push the caption north. Flatten the file. Export
## back to filestring.
 buildTitleCommand <- paste("convert -background '#0008' -fill white -gravity center -pointsize 72 -size 600x150 caption:\"", title, "\" ", filestring, " +swap -gravity north -composite ", filestring, sep="")

 if(exec==TRUE){
    try(system(buildAuthorCommand))
    try(system(buildTitleCommand))
 }else{
   response <- c(response, buildAuthorCommand, buildTitleCommand)
 }

  }## end loop
  if(exec==FALSE){
    return(response)
  }

}
