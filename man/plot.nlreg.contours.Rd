\name{plot.nlreg.contours}
\alias{plot.nlreg.contours}
\title{
  Use plot() on a `nlreg.contours' object
}
\description{
  This is a method for the function \code{\link[graphics]{plot}} for 
  objects inheriting from class \code{nlreg.contours}.  
}
\usage{
\method{plot}{nlreg.contours}(x, alpha = c(0.1, 0.05), drawlabels = FALSE, lwd1 = 1, lwd2 = 1, 
     lty1 = "solid", lty2 = "solid", cl1 = "blue", cl2 = "red", 
     col = "black", pch1 = 1, pch2 = 16, cex = 0.5, \dots)
}
\arguments{
  \item{x}{
    a \code{nlreg.contours} object, that is, the result of a call to
    \code{\link[nlreg]{contour.all.nlreg.profiles}}. 
  }
  \item{alpha}{
    a numerical vector defining the levels of the contours; the default
    is \code{c(0.1, 0.05)}, that is, \eqn{1-\alpha=0.9}{1-\code{alpha}=0.9} 
    and \eqn{1-\alpha=0.95}{1-\code{alpha}=0.95}.
  }
  \item{drawlabels}{
    logical value.  Contours are labelled if \code{TRUE}.
  }
  \item{lwd1, lwd2}{
    the line widths used to compare different curves in the same 
    plot; default is \code{lwd2 = 2} for higher order solutions and 
    \code{lwd1 = 1} for first order solutions.
  }
  \item{lty1, lty2}{
    line types used to compare different curves in the same plot; 
    default is \code{"solid"} for all statistics. 
  }
  \item{cl1, cl2, col}{
    colors used to compare different curves in the same plot; default
    is \code{cl2 = "red"} for higher order solutions, and 
    \code{cl1 = "blue"} for the remaining first order statistics.  
    The default color of the plot is \code{col = "black"}.
  }
  \item{pch1, pch2}{
    character types used to compare different values in the same plot; 
    default is \code{pch2 = 16} for higher order solutions, and 
    \code{pch1 = 1} for the remaining first order statistics.  
  }
  \item{cex}{
    the character expansions relative to the standard size of the 
    device to be used for printing text.  The default is 
    \code{cex = 0.5}.
  }
  \item{\dots}{
    additional graphics parameters.
  }
}
\value{
  No value is returned.
}
\section{Side Effects}{
  A plot is produced on the current graphics device.
}
\seealso{
  \code{\link[nlreg]{nlreg.contours.object}}, 
  \code{\link[nlreg]{contour.all.nlreg.profiles}}
}
\examples{
\dontrun{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
metsulfuron.prof <- profile( metsulfuron.nl, trace = TRUE )
metsulfuron.cont <- contour( metsulfuron.prof, ret = TRUE, plotit = FALSE )
par( mai = rep(0.2, 4) )
plot( metsulfuron.cont )}
}
\keyword{methods}
\keyword{hplot}
\keyword{regression}
\keyword{nonlinear}
