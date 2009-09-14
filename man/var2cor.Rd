\name{var2cor}
\alias{var2cor}
\title{
  Convert Covariance Matrix to Correlation Matrix --- Generic Function
}
\description{
  This function converts the covariance matrix from a fitted model into
  the correlation matrix.
}
\usage{
var2cor(object, \dots)
}
\arguments{
  \item{object}{
    any fitted model object from which a covariance matrix may be extracted.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This function is generic (see \code{\link[utils]{methods}}); method 
  functions can be written to handle specific classes of data.  
  Classes which already have methods for this function include: 
  \code{nlreg}, \code{summary.nlreg}, \code{mpl} and \code{summary.mpl}.
} 
\value{
  the correlation matrix of the estimates from a fitted model.
}
\seealso{
  \code{\link[nlreg]{var2cor.nlreg}}, \code{\link[nlreg]{var2cor.mpl}}, 
  \code{\link[utils]{methods}}
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
var2cor( metsulfuron.nl )
##
metsulfuron.sum <- summary( metsulfuron.nl, corr = FALSE )
var2cor( metsulfuron.sum )
}
\keyword{models}
\keyword{methods}
