\name{summary.all.nlreg.profiles}
\alias{summary.all.nlreg.profiles}
\title{
  Summary Method for Objects of Class `all.nlreg.profiles'
}
\description{
  Returns a summary list for objects of class 
  \code{all.nlreg.profiles}.
}
\usage{
\method{summary}{all.nlreg.profiles}(object, alpha = 0.05, twoside = TRUE, digits = NULL, \dots)
}
\arguments{
  \item{object}{
    an \code{all.nlreg.profiles} object, that is, the result from a call 
    to \code{\link[nlreg]{profile.nlreg}} with \code{offset = "all"}.
  }
  \item{alpha}{
    a vector of levels for confidence intervals; the default is 95\%, 
    that is, \eqn{1-\alpha = 0.95}{1-\code{alpha}=0.95}.
  }
  \item{twoside}{
    a logical value.  If \code{TRUE}, two-sided confidence intervals 
    are returned.  The default is \code{TRUE}.
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
  \code{\link[base]{summary}} for objects of class 
  \code{all.nlreg.profiles}.  It can be invoked by calling 
  \code{summary} or directly \code{summary.all.nlreg.profiles} for an 
  object of the appropriate class.
}
\value{
  A list is returned where the first components are named after the
  parameters of the nonlinear model that was profiled.  Each component
  represents a matrix with 
  \eqn{k\dim(\code{alpha})}{k*dim(\code{alpha})} rows and 2 columns, 
  where \eqn{k}{k} equals 2 or 4 depending on whether 
  \code{hoa = TRUE} in the call that generated the 
  \code{nlreg.profile} object. This matrix contains the upper and lower 
  confidence bounds for the test statistics considered and for the
  confidence levels defined through \code{alpha}.  The remaining 
  components are the following:
  \item{mle}{
    a \eqn{2\times d}{2 x d} matrix containing the \acronym{MLE}s and
    \acronym{s.e.}s of the \eqn{d}{d} parameters.
  }
  \item{offset}{
    a vector of character strings returning the parameter names.
  }
  \item{twoside}{
    a logical value indicating whether two-sided or one-sided 
    confidence intervals were calculated.
  }
  \item{hoa}{
    a logical value indicating whether higher order solutions were
    calculated.
  }
  \item{digits}{
    the number of significant digits to be printed.
  }
  \item{call}{
    an image of the call that produced the object, but with all 
    arguments named. 
  }
}
\seealso{
  \code{\link[nlreg]{nlreg.profile.objects}}, 
  \code{\link[nlreg]{profile.nlreg}}, \code{\link[base]{summary}}
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
metsulfuron.prof <- profile( metsulfuron.nl, trace = TRUE )
summary( metsulfuron.prof, alpha = c(0.1, 0.05) )
}
\keyword{methods}
\keyword{regression}
\keyword{nonlinear}
