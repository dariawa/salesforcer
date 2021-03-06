#' @param report_metadata \code{list}; a \code{list} with one element named 
#' \code{"reportMetadata"} having additional list elements underneath. All possible 
#' elements of \code{reportMetadata} are documented 
#' \href{https://developer.salesforce.com/docs/atlas.en-us.api_analytics.meta/api_analytics/sforce_analytics_rest_api_getbasic_reportmetadata.htm#analyticsapi_basicmetadata}{HERE}, 
#' but you will most commonly only need to specify the following 3 elements to 
#' filter or query the results of an existing report:  
#' \describe{
#'   \item{reportFormat}{A \code{character} specifying the format of the report 
#'   with possible values: \code{"TABULAR"}, \code{"SUMMARY"}, \code{"MATRIX"}, 
#'   or \code{"MULTI_BLOCK"}.}
#'   \item{reportBooleanFilter}{A \code{character} denoting how the individuals 
#'   filters specified in \code{reportFilters} should be combined. For example, 
#'   \code{"(1OR4)AND2AND3"}}.
#'   \item{reportFilters}{A \code{list} of reportFilter specifications. Each must 
#'   be a list with 3 elements: 1) \code{column}, 2) \code{operator}, and 3) \code{value}. 
#'   You can find out how certain field types can be filtered by reviewing the results 
#'   of \code{\link{sf_list_report_filter_operators}}.}
#' }
