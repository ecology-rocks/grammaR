#' Compile A File With Perl and Ocaml, Converting To .Tex
#'
#' This is the meaty function. It takes a filename, appends ".gram", then runs compile-grammar.pl over it. compile-grammar.pl MUST be in the same directory. Because I'm lazy. Then it'll run OCaml to execute the code and convert to .tex.
#' @param filename The name of the file, do not include the .gram extension.
#' @param n The number of times you want to generate the grammar and OCaml from scratch.
#' @param exec This is an error switch. Set to FALSE to see your system commands, if they are failing.
#'
#' @return Either this function is set to exec=TRUE and returns nothing, but writes a whole bunch of files, or is set to FALSE and returns the command strings to be executed later.
#' @export

createStory <- function(filename, n=1, exec=TRUE){
  response <- ""
  for(i in 1:n){
    perlcommand <- paste("perl compile-grammar.pl ",
                         filename, ".gram",
                         sep="",
                         collapse="")
    ocamlcommand <- paste("ocaml ",
                          filename, ".ml > ",
                          filename, "-", i, ".tex",
                          sep="")
    if(exec==TRUE){
    system(perlcommand)
    system(ocamlcommand)
    } else{
      response <- c(response, perlcommand, ocamlcommand)
    }
  }
  if(exec==FALSE){
    return(response)
  }
}
