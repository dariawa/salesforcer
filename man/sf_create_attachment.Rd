% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/attachments.R
\name{sf_create_attachment}
\alias{sf_create_attachment}
\title{Create Attachments}
\usage{
sf_create_attachment(
  attachment_input_data,
  object_name = c("Attachment", "Document"),
  api_type = c("SOAP", "REST", "Bulk 1.0", "Bulk 2.0"),
  control = list(...),
  ...,
  verbose = FALSE
)
}
\arguments{
\item{attachment_input_data}{\code{named vector}, \code{matrix},
\code{data.frame}, or \code{tbl_df}; data can be coerced into a
\code{data.frame}. The input must contain a column entitled 'Body' with an
absolute or relative file path (unless creating a Document using a Url)
along with other required fields depending on the object.If performing an
\code{update} operation, then one column or field of the input must be
the \code{Id} of the record to modify.}

\item{object_name}{\code{character}; the name of the Salesforce object that the
function is operating against (e.g. "Account", "Contact", "CustomObject__c").}

\item{api_type}{\code{character}; one of \code{"REST"}, \code{"SOAP"},
\code{"Bulk 1.0"}, or \code{"Bulk 2.0"} indicating which API to use when
making the request.}

\item{control}{\code{list}; a list of parameters for controlling the behavior of
the API call being used. For more information of what parameters are available
look at the documentation for \code{\link{sf_control}}.}

\item{...}{arguments passed to \code{\link{sf_control}} or further downstream
to \code{\link{sf_bulk_operation}}}

\item{verbose}{\code{logical}; an indicator of whether to print additional
detail for each API call, which is useful for debugging. More specifically, when
set to \code{TRUE} the URL, header, and body will be printed for each request,
along with additional diagnostic information where available.}
}
\value{
\code{tbl_df} with details of the created records
}
\description{
\ifelse{html}{\out{<a href='https://www.tidyverse.org/lifecycle/#experimental'><img src='figures/lifecycle-experimental.svg' alt='Experimental lifecycle'></a>}}{\strong{Experimental}}

This function will allow you to create attachments (and other blob data, such as
Documents) by supplying file paths (absolute or relative) to media that you
would like to upload to Salesforce along with accompanying metadata, such as
a Description, Keywords, ParentId, FolderId, etc.
}
\note{
The length of any file name can’t exceed 512 bytes (per Bulk 1.0 API).
The SOAP API create call restricts these files to a maximum size of 25 MB. For a file
attached to a Solution, the limit is 1.5 MB. The maximum email attachment size is 3 MB.
You can only create or update documents to a maximum size of 5 MB. The REST API
allows you to insert or update blob data limited to 50 MB of text data or 37.5 MB
of base64–encoded data.
}
\section{Salesforce Documentation}{

\itemize{
\item \href{https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_objects_attachment.htm}{Attachment Object (SOAP)}
\item \href{https://developer.salesforce.com/docs/atlas.en-us.api.meta/api/sforce_api_objects_document.htm}{Document Object (SOAP)}
\item \href{https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/dome_sobject_insert_update_blob.htm}{Insert or Update Blob Data}
}
}

\examples{
\dontrun{
# upload two PDFs from working directory to a particular record as Attachments
file_path1 <- here::here("doc1.pdf")
file_path2 <- here::here("doc2.pdf")
parent_record_id <- "0036A000002C6MmQAK"
attachment_details <- tibble(Body = c(file_path1, file_path2), 
                             ParentId = rep(parent_record_id, 2))
result <- sf_create_attachment(attachment_details)

# the function supports inserting all blob content, just update the 
# object_name argument to add the PDF as a Document instead of an Attachment
document_details <- tibble(Name = "doc1.pdf", 
                           Description = "Test Document 1", 
                           Body = file_path1,
                           FolderId = "00l6A000001EgIwQAK", # replace with your FolderId!
                           Keywords = "example,test,document")
result <- sf_create_attachment(document_details, object_name = "Document")

# the Bulk API can be invoked using api_type="Bulk 1.0" which will automatically 
# take a data.frame of Attachment info and create a ZIP file with CSV manifest 
# that is required for that API
result <- sf_create_attachment(attachment_details, api_type="Bulk 1.0")
}
}
\seealso{
Other Attachment functions: 
\code{\link{check_and_encode_files}()},
\code{\link{sf_delete_attachment}()},
\code{\link{sf_download_attachment}()},
\code{\link{sf_update_attachment}()}
}
\concept{Attachment functions}
