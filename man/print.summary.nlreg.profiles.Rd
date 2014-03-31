\name{print.summary.nlreg.profiles}
\alias{print.summary.nlreg.profiles}
\alias{print.summary.nlreg.profile}
\alias{print.summary.all.nlreg.profiles}
\title{
  Use print() on a `summary.nlreg.profile' and 
  `summary.all.nlreg.profiles' object
}
\description{
  This is a method for the function \code{print()} for objects 
  inheriting from class \code{summary.nlreg.profile} and
  \code{summary.all.nlreg.profiles}.  See \code{\link[base]{print}} 
  and \code{\link[base]{print.default}} for the general behaviour of 
  this function and for the interpretation of \code{x} and 
  \code{digits}.
}
\usage{
\method{print}{summary.nlreg.profile}(x, digits, \dots)
\method{print}{summary.all.nlreg.profiles}(x, digits, \dots)
}
\details{
  The function defaults to:
\preformatted{print.summary.nlreg.profile(x, 
                            digits = if(!is.null(x$digits)) x$digits
                                     else max(3, getOption("digits")-3), \dots)}
\preformatted{print.summary.all.nlreg.profiles(x, 
                                 digits = if(!is.null(x$digits)) x$digits
                                          else max(3, getOption("digits")-3), \dots)}
}
\seealso{
  \code{\link[nlreg]{summary.nlreg.profile}},
  \code{\link[nlreg]{summary.all.nlreg.profiles}},
  \code{\link[base]{print}}, \code{\link[base]{print.default}},
}
\keyword{internal}
\keyword{methods}
\keyword{print}
