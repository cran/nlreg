\name{allProfiles}
\alias{allProfiles}
\title{
  Support for function `profile.nlreg' --- Generic Function   
}
\description{
  This is support for the function \code{\link[nlreg]{profile.nlreg}}. 
  It is not intended to be called directly by users.
}
\usage{
allProfiles(fitted, \dots)
}
\arguments{
  \item{fitted}{
    a fitted \code{nlreg} object such as returned by a call to 
    \code{\link[nlreg]{nlreg}}.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  The \code{allProfiles.nlreg} function is called internally by the 
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
