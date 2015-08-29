#' Compile A File With Perl and Ocaml, Converting To .Tex
#'
#' This is the meaty function. It takes a filename, appends ".gram", then runs
#' compile-grammar.pl over it. compile-grammar.pl MUST be in the same directory.
#' Because I'm lazy. Then it'll run OCaml to execute the code and convert to
#' .tex. I hope to convert this functionality completely to R to avoid this
#' messy use of system commands.
#'
#' @param filename The name of the file, do not include the .gram extension.
#' @param n The number of times you want to generate the grammar and OCaml from
#'   scratch.
#' @param exec This is an error switch. Set to FALSE to see your system
#'   commands, if they are failing.
#'
#' @return Either this function is set to exec=TRUE and returns nothing, but
#'   writes a whole bunch of files, or is set to FALSE and returns the command
#'   strings to be executed later.
#' @export

createStory <- function(filename, n=1, exec=TRUE, outfileExt=".tex"){
  response <- ""

  if(!substr(filename, nchar(filename)-4, nchar(filename))==".gram"){
    filename <- paste(filename, ".gram", sep="")
  }
    #print("Woo hoo!!!")
  #}
  #
myResponseList <- ""
  for(i in 1:n){
    perlcommand <- paste("perl ",
                         system.file("perl", "compile-grammar.pl", package = "grammaR"),
                         " ",
                         filename,
                         sep="",
                         collapse="")
    ocamlcommand <- paste("ocaml ",
                          gsub(".gram", ".ml", filename),
                          " > ",
                          gsub(".gram", "", filename), "-", i, outfileExt,
                          sep="")
    if(exec==TRUE){
      system(perlcommand)
      system(ocamlcommand)
      myResponseList <- c(myResponseList, paste(gsub(".gram", "", filename),
                                                "-", i, outfileExt, sep=""))
    } else{
      response <- c(response, perlcommand, ocamlcommand)
    }


  }
  if(exec==FALSE){
    return(response)
  } else{
    cleanDocs(outfileExt)
    unlink(gsub(".gram", ".ml", filename))
    return(myResponseList[-1])
  }


}
