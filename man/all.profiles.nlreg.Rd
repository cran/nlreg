\name{all.profiles.nlreg}
\alias{all.profiles.nlreg}
\title{
  Support for function `profile.nlreg' 
}
\description{
  This is support for the function \code{\link[nlreg]{profile.nlreg}}. 
  It is not intended to be called directly by users.
}
\usage{
\method{all.profiles}{nlreg}(fitted, hoa = TRUE, precision = 6, signif = 30, 
                   n = 50, omit = 0.5, trace = FALSE, call, \dots)
}
\arguments{
  \item{fitted}{
    a fitted \code{nlreg} object such as returned by a call to 
    \code{\link[nlreg]{nlreg}}.
  }
  \item{hoa}{
    logical value indicating whether higher order statistics should be
    calculated; default is \code{TRUE}.
  }
  \item{precision}{
    numerical value defining the maximum range of values, given by 
    \acronym{MLE} \eqn{\pm}{+/-} \code{precision}*\acronym{s.e.}, that
    are profiled.  The default is 6.
  }
  \item{signif}{
    the maximum number of output points that are calculated exactly; 
    default is 30. 
  }
  \item{n}{
    the approximate number of output points produced by the spline
    interpolation; default is 50.
  }
  \item{omit}{
    numerical value defining the range of values, given by 
    \acronym{MLE} \eqn{\pm}{+/-} \code{omit}*\acronym{s.e.}, which is 
    omitted in the spline interpolation of the higher order statistics
    considered.  The purpose is to avoid numerical instabilities 
    around the maximum likelihood estimate.
  }
  \item{trace}{
    if \code{TRUE}, details of the iterations are printed.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  The \code{all.profiles.nlreg} function is called internally by the 
  \code{\link[nlreg]{profile.nlreg}} routine.  It is not intended to 
  be called directly by users. 
}
\value{
  a list of elements of class \code{all.nlreg.profiles} for profiling 
  all parameters of a nonlinear heteroscedastic model.  
}
\seealso{
  \code{\link[nlreg]{profile.nlreg}}, 
  \code{\link[nlreg]{nlreg.profile.objects}}, 
  \code{\link[nlreg]{nlreg.object}}
}
\keyword{internal}
\keyword{programming}
