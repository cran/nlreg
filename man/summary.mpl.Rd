\name{summary.mpl}
\alias{summary.mpl}
\title{
  Summary Method for `mpl' Objects
}
\description{
  Returns a summary list for objects of class \code{mpl}.
}
\usage{
\method{summary}{mpl}(object, correlation = FALSE, digits = NULL, \dots)}
\arguments{
  \item{object}{
    a fitted \code{mpl} object, that is, the result of a call to 
    \code{\link[nlreg]{mpl.nlreg}}. 
  }
  \item{correlation}{
    logical argument.  If \code{TRUE}, the (asymptotic) correlation 
    matrix for the 
    parameter estimates is computed; default is \code{FALSE}.
  }
  \item{digits}{
    the number of significant digits to be printed.  Defaults to 
    \code{NULL}. 
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This function is a method for the generic function 
  \code{\link[base]{summary}} for
  class \code{mpl}. It can be invoked by calling \code{summary} for an 
  object of the appropriate class, or directly by calling 
  \code{summary.mpl} regardless of the class of the object.
}
\value{
  A list is returned with the following components:
  \item{varPar}{
    the maximum adjusted profile likelihood estimates of the variance
    parameters. 
  }
  \item{coefficients}{
    the constrained \acronym{MLE}s of the regression coefficients 
    given the maximum adjusted profile likelihood estimates of the 
    variance parameters. 
  }
  \item{offset}{
    the values passed through the \code{offset} argument in the call 
    to \code{\link[nlreg]{mpl.nlreg}} that generated the \code{mpl} 
    object and to which the variance parameters were fixed.
  }
  \item{varParMLE}{
    the \acronym{MLE}s of the variance parameters.
  }
  \item{coefMLE}{
    the \acronym{MLE}s of the regression coefficients.
  }
  \item{varParCov}{
    the (asymptotic) covariance matrix of the variance parameters, 
    that is, the corresponding block in the inverse of the observed 
    information matrix.
  }
  \item{coefCov}{
    the (asymptotic) covariance matrix of the regression coefficients,
    that is, the corresponding block in the inverse of the observed 
    information matrix.
  }
  \item{lmp}{
    the adjusted profile log likelihood from the fit. 
  }
  \item{lp}{
    the profile log likelihood from the fit. 
  }
  \item{stats}{
    the indicator of which higher order solution was used.
  }
  \item{formula}{
    the model formula.
  }
  \item{meanFun}{
    the formula expression of the mean function.
  }
  \item{varFun}{
    the formula expression of the variance function.
  }
  \item{data}{
  a list representing a summary of the original data with the 
  following components.
    \describe{
      \item{\code{'offset name'}}{
         the predictor variable with no duplicated value.
      }
      \item{\code{repl}}{
        the number of replicates available for each value of the 
        predictor.
      }
      \item{\code{dupl}}{
        a vector of the same length than the predictor variable 
        indicating the position of each data point in the 
        \emph{offset name} component.
      }
      \item{\code{t1}}{
        the sum of the reponses for each design point in the
        \emph{offset name} component.
      } 
      \item{\code{t2}}{
        the sum of the squared responses for each design point in 
        the \emph{offset name} component. 
      }
    }
  }
  \item{nobs}{
    the number of observations.
  }
  \item{iter}{
    the number of interations needed for convergence; only if 
    \code{offset} was not \code{NULL} in the call to 
    \code{\link[nlreg]{mpl.nlreg}} which generated \code{object}.
  }
  \item{call}{
    an image of the call to \code{\link[nlreg]{mpl.nlreg}}, but with 
    all the arguments explicitly named.
  }
  \item{ws}{
    the workspace component of the original 
    \code{\link[nlreg:nlreg.object]{nlreg object}} plus the following 
    components:
      \describe{
        \item{\code{corr}}{
          a logical value indicating whether the correlation matrix
          should be printed.
        }
        \item{\code{digits}}{
         the number of significant digits to be printed.
        }
     }
  }
}
\seealso{
  \code{\link[nlreg]{mpl.object}}, \code{\link[nlreg]{nlreg.object}},
  \code{\link[base]{summary}}
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, hoa = TRUE, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)) )
##
metsulfuron.mpl <- mpl( metsulfuron.nl, trace = TRUE )
summary( metsulfuron.mpl, corr = FALSE )
}
\keyword{methods}
\keyword{regression}
\keyword{nonlinear}
