\name{summary.nlreg}
\alias{summary.nlreg}
\title{
  Summary Method for Nonlinear Heteroscedastic Models
}
\description{
  Returns a summary list for a fitted nonlinear heteroscedastic model.
}
\usage{
\method{summary}{nlreg}(object, observed = TRUE, correlation = FALSE, 
        digits = NULL, \dots)
}
\arguments{
  \item{object}{
    a fitted \code{nlreg} object.  This is assumed to be the result of
    some fit that produces an object inheriting from the class 
    \code{nlreg}, in the sense that the components returned by the 
    \code{\link[nlreg]{nlreg}} function will be available.
  }
  \item{observed}{
    logical argument.  If \code{TRUE}, the observed information is 
    used to calculate the covariance matrix, the expected information
    otherwise.  The default is \code{TRUE}.
  }
  \item{correlation}{
    logical argument.  If \code{TRUE}, the correlation matrix for the 
    parameter estimates is computed; default is \code{TRUE}.
  }
  \item{digits}{
    the number of significant digits to be printed.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This function is a method for the generic function 
  \code{\link[base]{summary}} for class \code{nlreg}. It can be 
  invoked by calling \code{summary} for an object of the appropriate 
  class, or directly by calling \code{summary.nlreg} regardless of
  the class of the object.
}
\value{
  A list is returned with the following components:
    \item{coefficients}{
      a matrix with four columns, containing the \acronym{MLE}s of the
      regression coefficients, their standard errors, the 
      \eqn{z}{z}-value (or Wald statistic) and the associated 
      \eqn{p}{p}-value based on the standard normal approximation to 
      the distribution of the \eqn{z}{z} statistic.
    }
    \item{varPar}{
      a matrix with two columns, containing the \acronym{MLE}s of the 
      variance parameters and their standard errors.
    }
    \item{offset}{
      a numerical vector with a single named element indicating the
      parameter of interest and the value to which it was fixed while
      fitting the nonlinear model.
    }
    \item{residuals}{
      the response residuals from the fit.  
    }
    \item{covariance}{
      the (asymptotic) covariance matrix for the parameter estimates.
    }
    \item{correlation}{
      the (asymptotic) correlation matrix for the parameter estimates.
    }
    \item{logLik}{
      the log likelihood from the fit.
    }
    \item{call}{
      an image of the call that produced the \code{nlreg} object, but 
      with the arguments all named.
    }
    \item{digits}{
      then number of significant digits to be printed.
    }
    \item{ws}{
      the \code{ws} component of the \code{nlreg} object.
    }
}
\seealso{
  \code{\link[nlreg]{nlreg.object}}, \code{\link[base]{summary}}
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
summary( metsulfuron.nl, digits = 3 )
##
print( summary( metsulfuron.nl )$cov, digits = 3 )
print( summary( metsulfuron.nl, observed = FALSE )$cov, digits = 3 )
}
\keyword{methods}
\keyword{regression}
\keyword{nonlinear}
