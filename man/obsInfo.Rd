\name{obsInfo}
\alias{obsInfo}
\title{
  Returns the Observed Information Matrix --- Generic Function
}
\description{
  Returns the observed information matrix from a fitted model object. 
}
\usage{
obsInfo(object, \dots)
}
\arguments{
  \item{object}{
    any fitted model object for which the observed information matrix 
    can be calculated. 
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  This function is generic (see \code{\link[utils]{methods}}); method 
  functions can be written to handle specific classes of data.  
  Classes which already have methods for this function include: 
  \code{nlreg}. 
}
\value{
  the observed information matrix for a fitted regression model.
}
\seealso{
  \code{\link[nlreg]{obsInfo.nlreg}}, \code{\link[nlreg]{nlreg.object}}, 
  \code{\link[nlreg]{expInfo}}
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ),
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)), 
           hoa = TRUE)
obsInfo( metsulfuron.nl )
}
\keyword{models}
