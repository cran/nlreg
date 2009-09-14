\name{summary.nlreg.profile}
\alias{summary.nlreg.profile}
\title{
  Summary Method for Objects of Class `nlreg.profile'
}
\description{
  Returns a summary list for objects of class \code{nlreg.profile}. 
}
\usage{
\method{summary}{nlreg.profile}(object, alpha = 0.05, twoside = TRUE, digits = NULL, \dots)
}
\arguments{
  \item{object}{
    a \code{nlreg.profile} object, that is, the result of a call to 
    \code{\link[nlreg]{profile.nlreg}}.
  }
  \item{alpha}{
    a vector of levels for confidence intervals; the default is 
    \eqn{1-\alpha=0.95}{1-\code{alpha}=0.95}.
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
  \code{nlreg.profile}.  It can be invoked by calling \code{summary} 
   or directly \code{summary.nlreg.profile} for an object of the
   appropriate class.
}
\value{
  A list is returned with the following components:
  \item{CI}{
    a matrix with \eqn{k\dim(\code{alpha})}{k*dim(\code{alpha})} rows 
    and 2 columns, where \eqn{k}{k} equals 2 or 4 depending on whether
    \code{hoa = TRUE} in the call that generated \code{object}.  This
    matrix contains the upper and lower confidence bounds for the 
    considered test statistics and for the confidence levels specified
    through \code{alpha}.
  }
  \item{inf.sk, np.sk, inf.fr, np.fr}{
    the information and nuisance parameters aspects, that is, the two 
    terms into which the higher order adjustment leading to the 
    \eqn{r^*}{r*} statistic can be decomposed.  The two versions refer 
    to respectively \cite{Skovgaard's (1996)} proposal and \cite{Fraser, 
    Reid and Wu's (1999)} solution.  Only if 
    \code{hoa = TRUE} in the function call that generated the 
    \code{nlreg.profile} object argument \code{object}.
  }
  \item{mle}{
    a numerical vector giving the \acronym{MLE} of the parameter of 
    interest and its standard error.
  }
  \item{offset}{
    character string giving the name of the interest parameter.
  }
  \item{twoside}{
    a logical value indicating whether two-sided or one-sided 
    confidence intervals were calculated.
  }
  \item{points}{
    the number of output points at which the considered statistics were
    calculated exactly.
  }
  \item{n}{
    the approximate number of points used in the spline interpolation 
    of the considered statistics.
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
  \item{\dots}{
    absorbs additional arguments.
  }
}
\references{
  Fraser, D.A.S., Reid, N. and Wu, J. (1999).  A simple general formula 
  for tail probabilities for frequentist and Bayesian inference. 
  \emph{Biometrika}, \bold{86}, 249--264.

  Skovgaard, I.  (1996) An explicit large-deviation approximation to
  one-parameter tests.  \emph{Bernoulli}, \bold{2}, 145--165.
}
\seealso{
  \code{\link[nlreg:nlreg.profile.objects]{nlreg.profile.object}},
  \code{\link[nlreg]{profile.nlreg}},
  \code{\link[base]{summary}} 
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
metsulfuron.prof <- profile( metsulfuron.nl, offset = g, trace = TRUE )
summary( metsulfuron.prof, alpha = c(0.9, 0.95) )
}
\keyword{methods}
\keyword{regression}
\keyword{nonlinear}
