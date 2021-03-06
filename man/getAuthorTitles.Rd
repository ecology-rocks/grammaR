% Generated by roxygen2 (4.1.1.9000): do not edit by hand
% Please edit documentation in R/getAuthorTitles.R
\name{getAuthorTitles}
\alias{getAuthorTitles}
\title{Extract Authors and Titles From LaTeX document}
\usage{
getAuthorTitles(sdir = ".", filetype = "*.tex", filename = NULL)
}
\arguments{
\item{sdir}{The directory to process}

\item{filetype}{The type of file to process. Currently only supports .tex files.}
}
\value{
This function returns a data.frame with titles and authors for a directory of LaTeX documents.
}
\description{
This function extracts the first 250 characters of a document, which should
be the front matter (document start, title, author, chapter headings, in that
order). It takes anything contained within brackets. It eliminates things
that don't look like a title or author, like "document" and "Front Matter",
then returns a data.frame where every odd entry is the title, and every even
entry is the author. This is a pretty narrow function, but it serves its purpose.
}

