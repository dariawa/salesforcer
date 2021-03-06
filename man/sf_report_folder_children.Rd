% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analytics-report-folder.R
\name{sf_report_folder_children}
\alias{sf_report_folder_children}
\title{Get the subfolders (children) of a report folder}
\usage{
sf_report_folder_children(report_folder_id, page_size = 10, page = NULL)
}
\arguments{
\item{report_folder_id}{\code{character}; the Salesforce Id assigned to a created
analytics folder (it will start with "00l").}

\item{page_size}{\code{integer}; integer that indicates how many results each
page returns. Default is 10.}

\item{page}{\code{integer}; integer that indicates which page of results to return.}
}
\description{
\ifelse{html}{\out{<a href='https://www.tidyverse.org/lifecycle/#experimental'><img src='figures/lifecycle-experimental.svg' alt='Experimental lifecycle'></a>}}{\strong{Experimental}}
}
