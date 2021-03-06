% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analytics-report.R
\name{sf_get_report_instance_results}
\alias{sf_get_report_instance_results}
\title{Get report instance results}
\usage{
sf_get_report_instance_results(
  report_id,
  report_instance_id,
  labels = TRUE,
  guess_types = TRUE,
  bind_using_character_cols = FALSE,
  fact_map_key = "T!T",
  verbose = FALSE
)
}
\arguments{
\item{report_id}{\code{character}; the Salesforce Id assigned to a created
analytics report. It will start with \code{"00O"}.}

\item{report_instance_id}{\code{character}; the Salesforce Id assigned to a
created analytics report instance (an asynchronous run). It will start with
\code{"0LG"}.}

\item{labels}{\code{logical}; an indicator of whether the returned data should
be the label (i.e. formatted value) or the actual value. By default, the labels
are returned because these are what appear in the Salesforce dashboard and
more closely align with the column names. For example, "Account.Name" label
may be \code{"Account B"} and the value \code{0016A0000035mJEQAY}. The former
(label) more accurately reflects the "Account.Name".}

\item{guess_types}{\code{logical}; indicating whether or not to use \code{col_guess()}
to try and cast the data returned in the recordset. If \code{TRUE} then
\code{col_guess()} is used, if \code{FALSE} then all fields will be returned
as character. This is helpful when \code{col_guess()} will mangle field values
in Salesforce that you'd like to preserve during translation into a \code{tbl_df},
like numeric looking values that must be preserved as strings ("48.0").}

\item{bind_using_character_cols}{\code{logical}; an indicator of whether to
cast the data to all character columns to ensure that \code{\link[dplyr:bind]{bind_rows}}
does not fail because two paginated recordsets have differing datatypes for the
same column. Set this to \code{TRUE} rarely, typically only when having this
set to \code{FALSE} returns an error or you want all columns in the data to be
character.}

\item{fact_map_key}{\code{character}; string providing an index into each
section of a fact map, from which you can access summary and detailed data.
The pattern for the fact map keys varies by report format so it is important
to know what the \code{reportFormat} property of the target report is. See the
note below for more details.}

\item{verbose}{\code{logical}; an indicator of whether to print additional
detail for each API call, which is useful for debugging. More specifically, when
set to \code{TRUE} the URL, header, and body will be printed for each request,
along with additional diagnostic information where available.}
}
\value{
\code{tbl_df}; the detail report data. More specifically, the detailed
data from the "T!T" entry in the fact map.
}
\description{
\ifelse{html}{\out{<a href='https://www.tidyverse.org/lifecycle/#experimental'><img src='figures/lifecycle-experimental.svg' alt='Experimental lifecycle'></a>}}{\strong{Experimental}}

Retrieves results for an instance of a report run asynchronously with or without
filters. Depending on your asynchronous report run request, data can be at the
summary level or include details.
}
\note{
Below are the fact map key patterns for three report types:
\describe{
\item{TABULAR}{\code{T!T}: The grand total of a report. Both record data
values and the grand total are represented by this key.}
\item{SUMMARY}{\code{<First level row grouping_second level row grouping_third 
  level row grouping>!T}: T refers to the row grand total.}
\item{MATRIX}{\code{<First level row grouping_second level row grouping>!<First 
  level column grouping_second level column grouping>.}}
}

Each item in a row or column grouping is numbered starting with 0. Here are
some examples of fact map keys:

\describe{
\item{0!T}{The first item in the first-level grouping.}
\item{1!T}{The second item in the first-level grouping.}
\item{0_0!T}{The first item in the first-level grouping and the first item
in the second-level grouping.}
\item{0_1!T}{The first item in the first-level grouping and the second item
in the second-level grouping.}
}
}
\section{Salesforce Documentation}{

\itemize{
\item \href{https://developer.salesforce.com/docs/atlas.en-us.api_analytics.meta/api_analytics/sforce_analytics_rest_api_instance_resource_results.htm}{Documentation}
\item \href{https://developer.salesforce.com/docs/atlas.en-us.api_analytics.meta/api_analytics/sforce_analytics_rest_api_get_reportdata.htm#example_instance_reportresults}{Example}
\item \href{https://developer.salesforce.com/docs/atlas.en-us.api_analytics.meta/api_analytics/sforce_analytics_rest_api_factmap_example.htm}{Factmap Documentation}
}
}

\examples{
\dontrun{
# execute a report asynchronously in your Org
all_reports <- sf_query("SELECT Id, Name FROM Report")
this_report_id <- all_reports$Id[1]
results <- sf_execute_report(this_report_id, async=TRUE)

# check if that report has succeeded, ... 
instance_list <- sf_list_report_instances(this_report_id)
instance_status <- instance_list[[which(instance_list$id == results$id), "status"]]

# ... if so, then grab the results
if(instance_status == "Success"){
  report_data <- sf_get_report_instance_results(report_id = this_report_id, 
                                                report_instance_id = results$id)
}
}
}
\seealso{
Other Report Instance functions: 
\code{\link{sf_delete_report_instance}()},
\code{\link{sf_list_report_instances}()}
}
\concept{Report Instance functions}
