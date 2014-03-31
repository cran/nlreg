\name{print.nlreg.contours}
\alias{print.nlreg.contours}
\title{
  Use print() on a `nlreg.contours' object
}
\description{
  Objects of class \code{nlreg.contours} have no proper 
  \code{\link[base]{print}} method.  They are plotted instead.
  See \code{\link[nlreg]{plot.nlreg.contours}} for details.
}
\usage{
\method{print}{nlreg.contours}(x, alpha = c(0.1, 0.05), drawlabels = FALSE, lwd1 = 1, lwd2 = 1, 
     lty1 = "solid", lty2 = "solid", cl1 = "blue", cl2 = "red", col = "black", 
     pch1 = 1, pch2 = 16, cex = 0.5, \dots)
}
\details{
  The function defaults to:
\preformatted{plot.nlreg.contours(x, alpha = c(0.1, 0.05), drawlabels = FALSE, lwd1 = 1, lwd2 = 1, 
                    lty1 = "solid", lty2 = "solid", cl1 = "blue", cl2 = "red", 
                    col = "black", pch1 = 1, pch2 = 16, cex = 0.5, \dots)}
}
\seealso{
  \code{\link[nlreg]{nlreg.contours.object}}, 
  \code{\link[nlreg]{plot.nlreg.contours}}
}
\keyword{internal}
\keyword{methods}
\keyword{print}
