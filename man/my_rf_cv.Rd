% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_rf_cv.R
\name{my_rf_cv}
\alias{my_rf_cv}
\title{Random Forest Cross-Validation}
\usage{
my_rf_cv(k)
}
\arguments{
\item{k}{number of folds}
}
\value{
a numeric with the cross-validation error
}
\description{
The purpose of this function is to test how good the random forest model fits in the
penguins dataset.
}
\examples{
my_rf_cv(5)

}
\keyword{prediction}
