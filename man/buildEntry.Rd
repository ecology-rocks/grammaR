% Generated by roxygen2 (4.1.1.9000): do not edit by hand
% Please edit documentation in R/buildEntry.R
\name{buildEntry}
\alias{buildEntry}
\title{Build Entry From Key And Values}
\usage{
buildEntry(key, values)
}
\arguments{
\item{key}{A string with the key value inside.}

\item{values}{A vector of strings with the values.}
}
\value{
This function returns your new string.
}
\description{
The tiniest function ever to build a key value entry. It is essentially the
opposite of extractKey and extract Value.
}
\examples{
buildEntry("rawr", c("a", "b", "c"))
}

