\name{mpl}
\alias{mpl}
\title{
  Maximum Adjusted Profile Likelihood Estimation --- Generic Function   
}
\description{
  Calculates the maximum adjusted profile likelihood estimates.
}
\usage{
mpl(fitted, \dots)
}
\arguments{
  \item{fitted}{
    any fitted model object for which the maximum adjusted profile
    likelihood estimates can be calculated.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This function is generic (see \code{\link[utils]{methods}}); method 
  functions can be written to handle specific classes of data.  Classes
  which already have methods for this function include: \code{nlreg}. 
}
\value{
  the maximum adjusted profile likelihood estimates for all parameters
  of a regression model or for a subset of them.
}
\seealso{
  \code{\link[nlreg]{mpl.nlreg}}, \code{\link[nlreg]{nlreg.object}},
  \code{\link[utils]{methods}} 
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, hoa = TRUE, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)) )
mpl( metsulfuron.nl, trace = TRUE )
##
options( object.size = 10000000 )
data(chlorsulfuron)
chlorsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
        weights = ~ ( 1+k*dose^g*(b2-b1)^2/(1+(dose/b4)^b3)^4*b3^2*dose^(2*b3-2)/
                    b4^(2*b3)/(b1+(b2-b1)/(1+(dose/b4)^b3))^2 ),
        start = c(b1 = 2.2, b2 = 1700, b3 = 2.8, b4 = 0.28, g = 2.7, k = 1), 
        data = chlorsulfuron, hoa = TRUE, trace = TRUE,  
        control = list(x.tol = 10^-12, rel.tol = 10^-12, step.min = 10^-12) )
mpl( chlorsulfuron.nl, trace = TRUE )
}
\keyword{models}
