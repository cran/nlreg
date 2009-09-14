\name{var2cor.nlregmpl}
\alias{var2cor.mpl}
\alias{var2cor.nlreg}
\alias{var2cor.summary.mpl}
\alias{var2cor.summary.nlreg}
\title{
  Use var2cor() on a `nlreg' and `mpl' object
}
\description{
  This is a method for the function \code{var2cor()} for objects 
  inheriting from class \code{nlreg} or \code{mpl}.  See 
  \code{\link[nlreg]{var2cor}} for the general behavior of this function 
  and for the interpretation of \code{object}.
}
\usage{
\method{var2cor}{mpl}(object, \dots)
\method{var2cor}{nlreg}(object, \dots)
\method{var2cor}{summary.mpl}(object, \dots)
\method{var2cor}{summary.nlreg}(object, \dots)
}
\seealso{
  \code{\link[nlreg]{mpl.object}}, \code{\link[nlreg]{nlreg.object}}, 
  \code{\link[nlreg]{var2cor}}
}
\keyword{methods}
\keyword{regression}
\keyword{nonlinear}
\keyword{internal}
