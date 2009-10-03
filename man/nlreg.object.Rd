\name{nlreg.object}
\alias{nlreg.object}
\title{
  Nonlinear Heteroscedastic Model Object
}
\description{
  Class of objects returned when fitting a nonlinear heteroscedastic
  model.
}
\arguments{
  The following components must be included in a \code{nlreg} object:
    \item{coef}{
       the \acronym{MLE}s of the regression coefficients, that is, of 
       the parameters appearing in the right-hand side of the 
       \code{formula} argument in the call that generated the 
       \code{nlreg} object.  
    }
    \item{varPar}{
      the \acronym{MLE}s of the variance parameters appearing in the 
      \code{weights} argument of the call that generated the 
      \code{nlreg} object.  If this argument was missing, the 
      \acronym{MLE} of \eqn{\log(\sigma^2)}{\code{log(s^2)}}, the 
      logarithm of the constant variance, is returned.
    }
    \item{offset}{
      a numerical vector with a single named element indicating the
      parameter of interest and the value to which it was fixed while
      fitting the nonlinear model.
    }
    \item{logLik}{
      the log likelihood from the fit.
    }
    \item{meanFun}{
      the formula expression of the mean function.
    }
    \item{varFun}{
      the formula expression of the variance function.
    }
    \item{data}{
      a list representing a summary of the original data with the 
      following components:
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
    \item{fitted}{
      the fitted values, that is, the mean function evaluated at each 
      data point.
    }
    \item{weights}{
      the variance function evaluated at each data point.
    }
    \item{residuals}{
      the response/standardized residuals from the fit.  
    }
    \item{start}{
      the starting values used to initialize the fitting routine.
    }
    \item{call}{
      an image of the call to \code{nlreg}, but with all the arguments
      explicitly named.
    }
    \item{ws}{
      a list containing information that is used in subsequent
      calculations with the following components: 
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
          generated the \code{nlreg} object.
        }
        \item{\code{missingData}}{
          a logical value indicating whether the \code{data} 
          argument was missing in the call that generated the 
          \code{nlreg} object.
        }
        \item{\code{frame}}{
          the name of the data frame if specified in the call to 
          \code{nlreg}.
        }
        \item{\code{iter}}{
          the number of iteration required until convergence (only 
          for non constant variance function).
        } 
        \item{\code{md}}{
          a function definition that returns the first two derivatives
          of the mean function if \code{hoa = TRUE} in the function 
          call that generated the \code{nlreg} object.
        }
        \item{\code{vd}}{
          a function definition that returns the first two derivatives
          of the variance function if \code{hoa = TRUE} in the 
          function call that generated the \code{nlreg} object.
        }
      }
    }
}
\section{Generation}{
  This class of objects is returned by the \code{\link[nlreg]{nlreg}} 
  function to 
  represent a fitted nonlinear heteroscedastic model.  Class 
  \code{nlreg} inherits from class \code{nls}, which represents a 
  homoscedastic nonlinear model fit.
}
\section{Methods}{
  Objects of this class have methods for the functions 
  \code{\link[base]{print}}, \code{\link[base]{summary}}, 
  \code{\link{fitted}} among others.
}
\note{
  The residuals, fitted values and coefficients should be extracted by
  the generic functions of the same name, rather than by the \code{$} 
  operator. 

  The \code{data} and \code{ws} components are not intended to be 
  directly accessed by users, but rather contain information invoked 
  by functions such as \code{\link[stats]{profile}} and 
  \code{\link[nlreg]{nlreg.diag}}.  
}
\seealso{
  \code{\link[nlreg]{nlreg}}, \code{\link[stats]{nls}}
}
\keyword{classes}
\keyword{regression}
\keyword{nonlinear}
