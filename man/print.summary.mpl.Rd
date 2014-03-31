\name{print.summary.mpl}
\alias{print.summary.mpl}
\title{
  Use print() on a `summary.mpl' object
}
\description{
  This is a method for the function \code{print()} for objects 
  inheriting from class \code{summary.mpl}.  See 
  \code{\link[base]{print}} and \code{\link[base]{print.default}} for 
  the general behaviour of this function and for the interpretation of
  \code{x} and \code{digits}.  
}
\usage{
\method{print}{summary.mpl}(x, corr = FALSE, digits, \dots)
}
\details{
  The function defaults to:
\preformatted{print.summary.mpl(x, corr = FALSE, 
                  digits = if(!is.null(x$digits)) x$digits 
                           else max(3, getOption("digits")-3), \dots)}
The \code{corr} argument is a logical value indicating whether the 
  (asymptotic) correlation matrix of the \acronym{MLE}s of the
  regression coefficients should be printed.
}
\seealso{
  \code{\link[nlreg]{summary.mpl}}, \code{\link[base]{print}}, 
  \code{\link[base]{print.default}}
}
\keyword{internal}
\keyword{methods}
\keyword{print}
