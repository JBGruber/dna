% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rDNA.R
\name{dna_getVariables}
\alias{dna_getVariables}
\title{Retrieve a dataframe with all variables for a statement type}
\usage{
dna_getVariables(connection, statementType)
}
\arguments{
\item{connection}{A \code{dna_connection} object created by the
\code{dna_connection} function.}

\item{statementType}{The statement type for which statements should be
retrieved. The statement type can be supplied as an integer or character
string, for example \code{1} or \code{"DNA Statement"}.}
}
\description{
Retrieve a dataframe with all variables defined in a given statement type.
}
\details{
For a given statement type ID (see \link{dna_getStatementTypes}), this
function creates a dataframe with one row per variable and contains columns
for the variable name and the data type associated with this variable.
}
\examples{
\dontrun{
dna_init()
conn <- dna_connection(dna_sample())
variables <- dna_getVariables(conn, 1)
}

}
\author{
Philip Leifeld
}
