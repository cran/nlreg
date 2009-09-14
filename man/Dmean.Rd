\name{Dmean}
\alias{Dmean}
\title{
  Differentiate the Mean Function of a Nonlinear Model
}
\description{
  Calculates the gradient and Hessian of the mean function of a 
  nonlinear heteroscedastic model.
}
\usage{
Dmean(nlregObj, hessian = TRUE)
}
\arguments{
  \item{nlregObj}{
    a nonlinear heteroscedastic model fit as obtained from a call to
    \code{\link[nlreg]{nlreg}}.  
  }
  \item{hessian}{
    logical value indicating whether the Hessian should be computed.  
    The default is \code{TRUE}.
  }
}
\details{
  The mean function is differentiated with respect to the regression 
  coefficients as specified in the \code{coef} component of the 
  \code{nlreg} object.  The returned function definition, however, 
  includes all parameters --- regression coefficients and variance 
  parameters --- as arguments.  When evaluated, it implicitly refers 
  to the data to whom the model was fitted and which must be on the 
  search list.  The gradient and Hessian are calculated for each data
  point: the \code{gradient} attribute is a 
  \eqn{n\times p}{\emph{n x p}} matrix and the \code{hessian} 
  attribute is a \eqn{n\times p\times p}{\emph{n x p x p}} array, 
  where \eqn{n}{\emph{n}} and \eqn{p}{\emph{p}} are respectively the 
  number of data points and the number of regression coefficients.
}
\value{
  a function whose arguments are named according to the parameters of
  the nonlinear model \code{nlregObj}.  When evaluated, it returns the
  value of the mean function along with attributes called 
  \code{gradient} and \code{hessian}, the latter if requested.  These 
  are the gradient and Hessian of the mean function with respect to the 
  regression coefficients.
}
\note{
 \code{Dmean} and \code{Dvar} are the two workhorse functions of the
  \code{nlreg} library.  The details are given in \cite{Brazzale 
  (2000, Section 6.1.2)}.

  The symbolic differentiation algorithm is based upon the
  \code{\link[stats:deriv]{D}} function.  As this algorithm is highly
  recursive, the \code{hessian = TRUE} argument should only be used if
  the Hessian matrix is needed.  Whenever possible, derivatives should
  be stored so as to be re-used in further calculations.  This is, for
  instance, achieved by the nonlinear heteroscedastic model fitting
  routine \code{\link[nlreg]{nlreg}} through the argument 
  \code{hoa = TRUE}.
}
\references{
  Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) \emph{The New
  S Language: A Programming Environment for Data Analysis and 
  Graphics}.  London: Chapman \& Hall.  Section 9.6.

  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss
  Federal Institute of Technology Lausanne.
}
\seealso{
  \code{\link[nlreg]{Dvar}}, \code{\link[nlreg]{nlreg.object}},
  \code{\link[stats:deriv]{deriv3}}, \code{\link[stats:deriv]{D}} 
  
}
\examples{
library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), 
                     start = c(b0 = 4, b1 = 0.1),  data = calcium )
Dmean( calcium.nl )
##function (b0, b1, logs)
##{
##    .expr3 <- exp(-b1 * time)
##    .expr4 <- 1 - .expr3
##    .expr6 <- .expr3 * time
##    .value <- b0 * .expr4
##    .grad <- array(0, c(length(.value), 2), list(NULL, c("b0",
##        "b1")))
##    .hessian <- array(0, c(length(.value), 2, 2), list(NULL,
##        c("b0", "b1"), c("b0", "b1")))
##    .grad[, "b0"] <- .expr4
##    .hessian[, "b0", "b0"] <- 0
##    .hessian[, "b0", "b1"] <- .hessian[, "b1", "b0"] <- .expr6
##    .grad[, "b1"] <- b0 * .expr6
##    .hessian[, "b1", "b1"] <- -(b0 * (.expr6 * time))
##    attr(.value, "gradient") <- .grad
##    attr(.value, "hessian") <- .hessian
##    .value
##}
##
param( calcium.nl )
##        b0         b1       logs
## 4.3093653  0.2084780 -1.2856765
##
attach( calcium )
calcium.md <- Dmean( calcium.nl )
attr( calcium.md( 4.31, 0.208, -1.29 ), "gradient" )
##              b0       b1
## [1,] 0.08935305 1.766200
## [2,] 0.08935305 1.766200
## [3,] 0.08935305 1.766200
## [4,] 0.23692580 4.275505
## \dots
detach()
}
\keyword{nonlinear}
