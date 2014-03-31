\name{print.summary.nlreg}
\alias{print.summary.nlreg}
\title{
  Use print() on a `summary.nlreg' object
}
\description{
  This is a method for the function \code{print()} for objects 
  inheriting from class \code{summary.nlreg}.  See 
  \code{\link[base]{print}} and \code{\link[base]{print.default}} for 
  the general behaviour of this function and for the interpretation of
  \code{x}, \code{digits}, \code{signif.stars} and \code{quote}.
}
\usage{
\method{print}{summary.nlreg}(x, digits, signif.stars, quote = TRUE, \dots)
}
\details{
  The function defaults to:
\preformatted{print.summary.nlreg(x, digits = max(3, getOption("digits")-3), 
                     signif.stars = getOption("show.signif.stars"), 
                     quote = TRUE, \dots)}
}
\seealso{
  \code{\link[nlreg]{summary.nlreg}}, \code{\link[base]{print}}, 
  \code{\link[base]{print.default}}
}
\keyword{internal}
\keyword{methods}
\keyword{print}
