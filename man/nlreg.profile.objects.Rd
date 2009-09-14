\name{nlreg.profile.objects}
\alias{nlreg.profile.object}
\alias{all.nlreg.profiles.object}
\title{
  Profile Objects for Nonlinear Heteroscedastic Models
}
\description{
  Class of objects returned when profiling a nonlinear heteroscedatic 
  model.
}
\section{Generation}{
  These classes of objects are returned by the 
  \code{\link[nlreg]{profile.nlreg}} function.  They contain all 
  elements needed to trace the profile plots and profile pair sketches
  for a fitted nonlinear heteroscedastic model.
}
\section{Methods}{
  Objects of these classes must be inspected or plotted with the
  corresponding \code{\link[base]{summary}} or 
  \code{\link[graphics]{plot}} methods.  No \code{print} method is 
  available.
}
\note{
  The components of these objects are not intended to be accessed 
  directly by users.  They contain information used by the 
  corresponding \code{summary} and \code{plot} methods.
}
\seealso{
  \code{\link[nlreg]{profile.nlreg}}, 
  \code{\link[nlreg]{summary.nlreg.profile}}, 
  \code{\link[nlreg]{summary.all.nlreg.profiles}}, 
  \code{\link[nlreg:plot.nlreg.profiles]{plot.nlreg.profile}}, 
  \code{\link[nlreg:plot.nlreg.profiles]{plot.all.nlreg.profiles}}, 
  \code{\link[nlreg]{contour.all.nlreg.profiles}},  
  \code{\link[nlreg]{nlreg.object}}
}
\keyword{internal}
\keyword{classes}
\keyword{regression}
\keyword{nonlinear}
