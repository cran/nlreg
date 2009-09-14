\name{mpl.object}
\alias{mpl.object}
\title{
  Maximum Adjusted Profile Likelihood Object
}
\description{
  Class of objects returned when calculating the maximum adjusted
  profile likelihood estimates of the variance parameters of a 
  nonlinear heteroscedastic model.
}
\section{Generation}{
  This class of objects is returned by the 
  \code{\link[nlreg]{mpl.nlreg}} function.  Class \code{mpl} inherits
  from class \code{nlreg}.
}
\arguments{
  The following components must be included in a \code{mpl} object:
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
    \code{offset} is not \code{NULL}.
  }
  \item{call}{
    an image of the call to \code{mpl.nlreg}, but with all the 
    arguments explicitly named.
  }
  \item{ws}{
    a list containing information that is used in subsequent 
    calculations, that is:
      \describe{
        \item{\code{allPar}}{       
          the \acronym{MLE}s of all parameters.
        }
        \item{\code{homVar}}{
          a logical value indicating whether the variance function is 
          constant.
        }
        \item{\code{xVar}}{
          a logical value indicating whether the variance function 
          depends on the predictor variable.
        }
        \item{\code{hoa}}{
          the value of the \code{hoa} argument in the call that 
          generated the \code{nlreg} object passed through the 
          \code{fitted} argument.
        }
        \item{\code{missingData}}{
          a logical value indicating whether the \code{data} 
          argument was missing in the call that generated the 
          \code{nlreg} object passed through the 
          \code{fitted} argument.
        }
        \item{\code{frame}}{
          the name of the data frame if specified in the call to 
          \code{nlreg} that generated the \code{fitted} argument.
        }
        \item{\code{iter}}{
          the number of iteration required until convergence (only 
          for non constant variance function).
        } 
        \item{\code{md}}{
          a function definition that returns the first two derivatives
          of the mean function if \code{hoa = TRUE} in the function 
          call that generated the \code{nlreg} object passed through 
          the \code{fitted} argument.
        }
        \item{\code{vd}}{
          a function definition that returns the first two derivatives
          of the variance function if \code{hoa = TRUE} in the 
          function call that generated the \code{nlreg} object passed 
          through the \code{fitted} argument.
        }
      }
  }
}
\section{Methods}{
  Objects of this class have methods for the functions 
  \code{\link[base]{print}}, \code{\link[base]{summary}}, 
  \code{\link{coef}} and \code{\link[nlreg]{param}}.
}
\note{
  The coefficients and variance parameters should be extracted by 
  the generic functions of the same name, rather than by the \code{$} 
  operator. 

  The \code{data} and \code{ws} components are not intended to be 
  directly used by users, but rather contain information used by 
  functions such as \code{summary}. 
}
\seealso{
  \code{\link[nlreg]{mpl.nlreg}}, \code{\link[nlreg]{mpl}}, 
  \code{\link[nlreg]{nlreg.object}} 
}
\keyword{classes}
\keyword{regression}
\keyword{nonlinear}
