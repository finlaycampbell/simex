% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.simex.R
\name{summary.simex}
\alias{summary.simex}
\title{Generate summary statistics for a simex object.}
\usage{
\method{summary}{simex}(simex, day = dim(simex$prevalence)[1])
}
\arguments{
\item{simex}{The solved system of equations as returned by \code{run_model}.}

\item{day}{What day of the outbreak to summarise to}
}
\description{
Generate summary statistics for a simex object.
}
\author{
Finlay Campbell
}
