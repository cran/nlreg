\name{logLik.nlreg}
\alias{logLik.nlreg}
\title{
  Compute the Log Likelihood for Nonlinear Heteroscedastic Models
}
\description{
  Computes the log likelihood for a nonlinear model with possibly non
  constant variance.
}
\usage{
\method{logLik}{nlreg}(object, \dots)
}
\arguments{
  \item{object}{
    an object inheriting from class \code{nlreg} representing a fitted
    nonlinear heteroscedastic model.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This is a method for the function \code{logLik()} for objects
  inheriting from class \code{nlreg}.  
}
\value{
  Returns an object class \code{logLik} which is a number
  with attributes \code{nobs}, \code{npar} and \code{df}  
  giving respectively the number of observations, the number of 
  parameters (regression coefficients plus variance parameters) and
  the degrees of freedom in the model.  
}
\note{
  The default 
  \code{print} method for \code{logLik} objects is used.
}
\seealso{
  \code{\link[marg]{rsm.object}}, \code{\link[stats]{logLik}}
}
\examples{
library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), 
                     start = c(b0 = 4, b1 = 0.1), data = calcium )
logLik( calcium.nl )
##
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
logLik( metsulfuron.nl )
}
\keyword{methods}
\keyword{models}
\keyword{regression}
