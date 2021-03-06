% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-query.R
\name{set_null_elements_to_na}
\alias{set_null_elements_to_na}
\title{Set all NULL or zero-length elements from list to NA}
\usage{
set_null_elements_to_na(x)
}
\arguments{
\item{x}{\code{list}; a list to be cleaned.}
}
\value{
\code{list} containing \code{NA} in place of \code{NULL} element values.
}
\description{
This function is a simple \code{\link[purrr:modify]{modify_if}} function
to replace zero-length elements (includes \code{NULL}) to \code{NA} in a
one-level list.
}
\note{
This function is meant to be used internally. Only use when debugging.
}
\keyword{internal}
