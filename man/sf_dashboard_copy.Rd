% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analytics-dashboard.R
\name{sf_dashboard_copy}
\alias{sf_dashboard_copy}
\title{Copy a dashboard}
\usage{
sf_dashboard_copy(dashboard_id, report_folder_id)
}
\arguments{
\item{dashboard_id}{\code{character}; the Salesforce Id assigned to a created
dashboard. It will start with \code{"01Z"}.}

\item{report_folder_id}{\code{character}; the Salesforce Id assigned to a created
analytics folder (it will start with "00l").}
}
\value{
\code{list}
}
\description{
\ifelse{html}{\out{<a href='https://www.tidyverse.org/lifecycle/#experimental'><img src='figures/lifecycle-experimental.svg' alt='Experimental lifecycle'></a>}}{\strong{Experimental}}
}
