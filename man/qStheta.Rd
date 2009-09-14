\name{qStheta}
\alias{qhat.nlreg}
\alias{Shat.nlreg}
\alias{theta.deriv}
\title{
  Support for `nlreg' package of `hoa' bundle
}
\description{
  Support routines for various functions in \code{nlreg}
  package
}  
\usage{
qhat.nlreg(nlregObj1, nlregObj0, par.1, par.0, mu.1, mu.0, v.1, v.0, 
           m1.1 = NULL, v1.1 = NULL)
Shat.nlreg(nlregObj1, nlregObj0, par.1, par.0, mu.1, mu.0, v.1, v.0, 
           m1.1 = NULL, m1.0 = NULL, v1.1 = NULL, v1.0 = NULL)
theta.deriv(nlregObj, par, mu, v, m1 = NULL, v1 = NULL)
}
\details{
  \code{qhat.nlreg} and \code{Shat.nlreg} are support routines for 
  \code{\link[nlreg]{nlreg.diag}}, \code{\link[nlreg]{profile.nlreg}}
  and, the latter, \code{\link[nlreg]{mpl.nlreg}}, and should not be
  used on their own.  

  \code{theta.deriv} is a support routine for 
  \code{\link[nlreg]{expInfo.nlreg}}, \code{qhat.nlreg} and 
   \code{Shat.nlreg}, and should not be used on its own.
}
\keyword{internal}
\keyword{programming}
