\name{nlreg.contours.object}
\alias{nlreg.contours.object}
\title{
  Contour Object for Nonlinear Heteroscedastic Models
}
\description{
  Class of objects returned when creating the contour plots of a 
  nonlinear heteroscedatic model.
}
\section{Generation}{
  This class of objects is returned by the 
  \code{\link[nlreg]{contour.all.nlreg.profiles}} function.  It 
  contains all elements  needed to trace the univariate and bivariate 
  profile plots for a fitted nonlinear heteroscedastic model.
}
\section{Methods}{
  Objects of this class must be plotted with the corresponding 
  \code{\link[graphics]{plot}} methods.  No \code{print} or 
  \code{summary} method is available.
}
\note{
  The components of this object are not intended to be accessed 
  directly by users.  They contain information used by the 
  corresponding \code{plot} method.
}
\seealso{
  \code{\link[nlreg]{contour.all.nlreg.profiles}}, 
  \code{\link[nlreg]{plot.nlreg.contours}},
  \code{\link[nlreg]{nlreg.object}}
}
\keyword{internal}
\keyword{classes}
\keyword{regression}
\keyword{nonlinear}
