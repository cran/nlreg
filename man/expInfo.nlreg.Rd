\name{expInfo.nlreg}
\alias{expInfo.nlreg}
\title{
  Expected Information Matrix for `nlreg' Objects
}
\description{
  Returns the expected information matrix for a fitted \code{nlreg}
  model. 
}
\usage{
\method{expInfo}{nlreg}(object, par, mu, v, m1 = NULL, v1 = NULL, \dots)
}
\arguments{
  \item{object}{
    a fitted \code{nlreg} object such as returned by a call to 
    \code{\link[nlreg]{nlreg}}.
  }
  \item{par}{
    a vector of parameter values where each element is named after the
    parameter it represents.  If missing, the values in the 
    \code{ws$allPar} component of \code{object} are used.
  }
  \item{mu}{
    numerical vector containing the mean function evaluated at each 
    data point.  If missing, the fitted values saved in 
    \code{object} are used.
  }
  \item{v}{
    numerical vector containing the variance function evaluated at 
    each data point.  If missing, the values of the \code{weights} 
    component of \code{object} are used.
  }
  \item{m1}{
    a matrix whose rows represent the gradients of the mean function
    evaluated at each data point.  If \code{NULL}, the \code{gradient}
    attribute of the object returned by a call to 
    \code{\link[nlreg]{Dmean}} is used.   
  }
  \item{v1}{
    a matrix whose rows represent the gradient of the variance 
    function evaluated at each data point.  If \code{NULL}, the 
    \code{gradient} attribute of the object returned  by a call to 
    \code{\link[nlreg]{Dvar}} is used.   
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This function is a method for the generic function 
  \code{\link[nlreg]{expInfo}} for objects inheriting from class 
  \code{nlreg}.
}

\value{
  the expected information matrix of the fitted nonlinear model passed
  through the \code{object} argument.
}
\note{
  This function is mostly intended for internal use.  It is called by
  functions such as \code{\link[nlreg]{nlreg.diag}}, 
  \code{\link[nlreg]{summary.nlreg}} and 
  \code{\link[nlreg]{profile.nlreg}}.  To extract the expected 
  information matrix from a fitted \code{nlreg} object, the generic 
  method \code{\link[nlreg]{expInfo}} should be used.
}
\seealso{
  \code{\link[nlreg]{expInfo}}, \code{\link[nlreg]{nlreg.object}}, 
  \code{\link[nlreg]{obsInfo}}
}
\keyword{methods}
\keyword{regression}
\keyword{nonlinear}
