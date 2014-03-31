\name{print.nlreg}
\alias{print.nlreg}
\title{
  Use print() on a `nlreg' object
}
\description{
  This is a method for the function \code{print()} for objects inheriting from 
  class \code{nlreg}.  See \code{\link[base]{print}} and 
  \code{\link[base]{print.default}} for the general behaviour of this function 
  and for the interpretation of \code{digits}.
}
\usage{
\method{print}{nlreg}(x, digits = max(3, getOption("digits")-3), \dots)
}
\details{
  The method defaults to:
\preformatted{plot.nlreg(x, digits = max(3, getOption("digits")-3), \dots)}
}
\seealso{
  \code{\link[nlreg]{nlreg.object}}, \code{\link[base]{print}},
  \code{\link[base]{print.default}}
}
\keyword{internal}
\keyword{methods}
\keyword{print}
