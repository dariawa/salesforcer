% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analytics-report.R
\name{sf_copy_report}
\alias{sf_copy_report}
\title{Copy a report}
\usage{
sf_copy_report(report_id, name = NULL, verbose = FALSE)
}
\arguments{
\item{report_id}{\code{character}; the Salesforce Id assigned to a created
analytics report. It will start with \code{"00O"}.}

\item{name}{\code{character}; a user-specified name for the newly cloned report.
If left \code{NULL}, then the new name will be the same name as the report being
cloned appended with " = Copy" that is prefixed with a number if that name is
not unique. It is highly recommended to provide a name, if possible.}

\item{verbose}{\code{logical}; an indicator of whether to print additional
detail for each API call, which is useful for debugging. More specifically, when
set to \code{TRUE} the URL, header, and body will be printed for each request,
along with additional diagnostic information where available.}
}
\value{
\code{list} representing the newly cloned report with up to 4 properties
that describe the report:
\describe{
\item{attributes}{Report type along with the URL to retrieve common objects and
joined metadata.}
\item{reportMetadata}{Unique identifiers for groupings and summaries.}
\item{reportTypeMetadata}{Fields in each section of a report type plus filter information for those fields.}
\item{reportExtendedMetadata}{Additional information about summaries and groupings.}
}
}
\description{
\ifelse{html}{\out{<a href='https://www.tidyverse.org/lifecycle/#experimental'><img src='figures/lifecycle-experimental.svg' alt='Experimental lifecycle'></a>}}{\strong{Experimental}}

Creates a copy of a custom, standard, or public report by sending a POST
request to the Report List resource.
}
\section{Salesforce Documentation}{

\itemize{
\item \href{https://developer.salesforce.com/docs/atlas.en-us.api_analytics.meta/api_analytics/sforce_analytics_rest_api_clone_report.htm}{Documentation}
}
}

\examples{
\dontrun{
# only the 200 most recently viewed reports
most_recent_reports <- sf_report_list()

# all possible reports in your Org
all_reports <- sf_query("SELECT Id, Name FROM Report")

# id of the report to copy
this_report_id <- all_reports$Id[1]

# not providing a name appends " - Copy" to the name of the report being cloned
report_details <- sf_copy_report(this_report_id)

# example of providing new name to the copied report
report_details <- sf_copy_report(this_report_id, "My New Copy of Report ABC")
}
}
\seealso{
Other Report functions: 
\code{\link{sf_create_report}()},
\code{\link{sf_delete_report}()},
\code{\link{sf_describe_report_type}()},
\code{\link{sf_describe_report}()},
\code{\link{sf_execute_report}()},
\code{\link{sf_list_report_fields}()},
\code{\link{sf_list_report_filter_operators}()},
\code{\link{sf_list_report_types}()},
\code{\link{sf_list_reports}()},
\code{\link{sf_query_report}()},
\code{\link{sf_run_report}()},
\code{\link{sf_update_report}()}
}
\concept{Report functions}
