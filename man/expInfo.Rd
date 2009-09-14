\name{expInfo}
\alias{expInfo}
\title{
  Returns the Expected Information Matrix --- Generic Function
}
\description{
  Returns the expected information matrix from a fitted model object. 
}
\usage{
expInfo(object, \dots)
}
\arguments{
  \item{object}{
    any fitted model object for which the observed information can be
    calculated. 
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
  the expected information matrix for a fitted regression model.
}
\seealso{
  \code{\link[nlreg]{expInfo.nlreg}}, \code{\link[nlreg]{nlreg.object}},
  \code{\link[nlreg]{obsInfo}} 
  
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ),
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)), 
           hoa = TRUE)
expInfo( metsulfuron.nl )
}
\keyword{models}
