\name{print.mpl}
\alias{print.mpl}
\title{
  Use print() on a `mpl' object
}
\description{
  This is a method for the function \code{print()} for objects 
  inheriting from class \code{mpl}.  See \code{\link[base]{print}} and
  \code{\link[base]{print.default}} for the general behaviour of this 
  function and for the interpretation of \code{x} and \code{digits}.
}
\usage{
\method{print}{mpl}(x, digits = value, \dots)
}
\synopsis{
\method{print}{mpl}(x, digits = max(3, getOption("digits")-3), \dots)
}
\seealso{
  \code{\link[nlreg]{mpl.object}}, \code{\link[base]{print}},
  \code{\link[base]{print.default}} 
}
\keyword{internal}
\keyword{print}
\keyword{methods}
