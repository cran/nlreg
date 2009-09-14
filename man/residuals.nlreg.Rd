\name{residuals.nlreg}
\alias{residuals.nlreg}
\alias{resid.nlreg}
\title{
  Use residuals() on a `nlreg' object
}
\description{
  This is a method for the function \code{residuals()} for objects 
  inheriting from class \code{nlreg}.  It extracts the standardized
  residuals from a nonlinear model fit.  See \code{\link{residuals}} for
  the general behavior of this function and for the interpretation of
  \code{object}.  A wider choice of residuals is available through the
  \code{\link[nlreg]{nlreg.diag}} function.
}
\usage{
\method{residuals}{nlreg}(object, \dots)
\method{resid}{nlreg}(object, \dots)
}
\seealso{
  \code{\link[nlreg]{nlreg.object}}, \code{\link[nlreg]{nlreg.diag}}, 
  \code{\link{residuals}}
}
\keyword{internal}
\keyword{methods}
\keyword{nonlinear}
