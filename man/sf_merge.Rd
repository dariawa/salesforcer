% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-org.R
\name{sf_merge}
\alias{sf_merge}
\title{Merge Records}
\usage{
sf_merge(
  master_id,
  victim_ids,
  object_name,
  master_fields = character(0),
  api_type = c("SOAP"),
  control = list(...),
  ...,
  verbose = FALSE
)
}
\arguments{
\item{master_id}{\code{character}; a Salesforce generated Id that identifies the master record,
which is the record to which the victim records will be merged into}

\item{victim_ids}{\code{character}; one or two Salesforce Ids of records to be merged into
the master record. Up to three records can be merged in a single request, including
the master record. This limit is the same as the limit enforced by the Salesforce user
interface. To merge more than 3 records, successively merge records by running
\code{\link{sf_merge}} repeatedly.}

\item{object_name}{\code{character}; the name of the Salesforce object that the
function is operating against (e.g. "Account", "Contact", "CustomObject__c").}

\item{master_fields}{\code{named vector}; a vector of field names and values to
supersede the master record values. Otherwise, the field values on the master record
will prevail.}

\item{api_type}{\code{character}; one of \code{"REST"}, \code{"SOAP"},
\code{"Bulk 1.0"}, or \code{"Bulk 2.0"} indicating which API to use when
making the request.}

\item{control}{\code{list}; a list of parameters for controlling the behavior of
the API call being used. For more information of what parameters are available
look at the documentation for \code{\link{sf_control}}.}

\item{...}{arguments passed to \code{\link{sf_control}}}

\item{verbose}{\code{logical}; an indicator of whether to print additional
detail for each API call, which is useful for debugging. More specifically, when
set to \code{TRUE} the URL, header, and body will be printed for each request,
along with additional diagnostic information where available.}
}
\value{
\code{tbl_df} of records with success indicator
}
\description{
\ifelse{html}{\out{<a href='https://www.tidyverse.org/lifecycle/#experimental'><img src='figures/lifecycle-experimental.svg' alt='Experimental lifecycle'></a>}}{\strong{Experimental}}

This function combines records of the same object type into one of the records,
known as the master record. The other records, known as the victim records, will
be deleted. If a victim record has related records the master record the new
parent of the related records.
}
\examples{
\dontrun{
n <- 3
new_contacts <- tibble(FirstName = rep("Test", n),
                       LastName = paste0("Contact", 1:n),
                       Description = paste0("Description", 1:n))
new_recs1 <- sf_create(new_contacts, object_name = "Contact")

# merge the second and third into the first record, but set the
# description field equal to the description of the second. All other fields
# will from the first record or, if blank, from the other records
merge_res <- sf_merge(master_id = new_recs1$id[1],
                      victim_ids = new_recs1$id[2:3],
                      object_name = "Contact",
                      master_fields = tibble("Description" = new_contacts$Description[2]))
# check the second and third records now have the same Master Record Id as the first
merge_check <- sf_query(sprintf("SELECT Id, MasterRecordId, Description 
                                 FROM Contact WHERE Id IN ('\%s')", 
                                 paste0(new_recs1$id, collapse="','")), 
                        queryall = TRUE)
}
}
