\name{param}
\alias{param}
\title{
  Extract All Parameters from a Model --- Generic Function
}
\description{
  This function extracts all parameters (regression coefficients, 
  variance parameters etc.) from a fitted model.
}
\usage{
param(object, \dots)
}
\arguments{
  \item{object}{
    any fitted model object from which parameters may be extracted.
  }
  \item{\dots}{
    additional arguments like \code{digits} to control how many digits
    should be printed.
  }
}
\details{
  This function is generic (see \code{\link[utils]{methods}}); method 
  functions can be written to handle specific classes of data.  
  Classes which already have methods for this function include: 
  \code{nlreg}.
} 
\value{
  all parameters (regression coefficients, variance parameters etc.) 
  of a fitted model.
}
\seealso{
  \code{\link[nlreg]{param.nlreg}}, \code{\link[utils]{methods}}
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
param( metsulfuron.nl )
##          b1           b2           b3           b4            g         logs
## 139.0395322 2471.5097481    1.7091297    0.0772535   -1.2582597   -3.8198406
}
\keyword{models}
\keyword{methods}
