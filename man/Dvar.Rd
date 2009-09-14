\name{Dvar}
\alias{Dvar}
\title{
  Differentiate the Variance Function of a Nonlinear Model
}
\description{
  Calculates the gradient and Hessian of the variance function of a
  nonlinear heteroscedastic model.
}
\usage{
Dvar(nlregObj, hessian = TRUE)
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
  The variance function is differentiated with respect to the variance
  parameters specified in the \code{varPar} component of the 
  \code{nlregObj} object and, if the variance function depends on 
  them, with respect to the regression coefficients specified in the
  \code{coef} component.  The  returned function definition includes 
  all parameters.  When evaluated, it implicitly refers to the data to
  whom the \code{nlreg} object was fitted and which must be on the 
  search list.  The gradient and Hessian are calculated for each data
  point: the \code{gradient} attribute is a 
  \eqn{n\times p}{\emph{n x p}} matrix, and the \code{hessian} 
  attribute is a \eqn{n\times p\times p}{\emph{n x p x p}} array, 
  where \eqn{n}{\emph{n}} and \eqn{p}{\emph{p}} are respectively the 
  number of data points and the number of regression coefficients.
}
\value{
  a function whose arguments are named according to the parameters of
  the nonlinear model \code{nlregObj}.  When evaluated, it returns the
  value of the variance function along with attributes called 
  \code{gradient} and \code{hessian}, the latter if requested.  These 
  are the gradient and Hessian of the variance function with respect 
  to the model parameters.
}
\note{
 \code{Dmean} and \code{Dvar} are the two workhorse functions of the
  \code{nlreg} library.  The details are given in \cite{Brazzale 
  (2000, Section 6.1.2)}.

  The symbolic differentiation algorithm is based upon the
  \code{\link[stats:deriv]{D}} function.  As this algorithm is highly 
  recursive, the \code{hessian = TRUE} argument should only be used if
  the Hessian matrix is needed.  Whenever possible, derivatives 
  should be stored so as to be re-used in further calculations.  This
  is, for instance, achieved for the nonlinear heteroscedastic model 
  fitting routine \code{\link[nlreg]{nlreg}} through the argument 
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
  \code{\link[nlreg]{Dmean}}, \code{\link[nlreg]{nlreg.object}},
  \code{\link[stats:deriv]{deriv3}}, \code{\link[stats:deriv]{D}}
}
\examples{
library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), 
                     start = c(b0 = 4, b1 = 0.1), data = calcium )
Dvar( calcium.nl )
##function (b0, b1, logs)
##{
##    .expr1 <- exp(logs)
##    .value <- .expr1
##    .grad <- array(0, c(length(.value), 1), list(NULL, c("logs")))
##    .hessian <- array(0, c(length(.value), 1, 1), list(NULL,
##        c("logs"), c("logs")))
##    .grad[, "logs"] <- .expr1
##    .hessian[, "logs", "logs"] <- .expr1
##    attr(.value, "gradient") <- .grad
##    attr(.value, "hessian") <- .hessian
##    .value
##}
##
attach( calcium )
calcium.vd <- Dvar( calcium.nl )
param( calcium.nl )
##        b0         b1       logs
## 4.3093653  0.2084780 -1.2856765
##
attr( calcium.vd( 4.31, 0.208, -1.29 ), "gradient" )
##          logs
##[1,] 0.2752708
##
calcium.nl <- update( calcium.nl, weights = ~ ( 1+time^g )^2, 
                      start = c(b0 = 4, b1 = 0.1, g = 1))
Dvar( calcium.nl )
##function (b0, b1, g, logs) 
##{
##    .expr1 <- time^g
##    .expr2 <- 1 + .expr1
##    .expr4 <- exp(logs)
##    .expr5 <- .expr2^2 * .expr4
##    .expr6 <- log(time)
##    .expr7 <- .expr1 * .expr6
##    .expr10 <- 2 * (.expr7 * .expr2) * .expr4
##    .value <- .expr5
##    .grad <- array(0, c(length(.value), 2), list(NULL, c("g",
##        "logs")))
##    .hessian <- array(0, c(length(.value), 2, 2), list(NULL,
##        c("g", "logs"), c("g", "logs")))
##    .grad[, "g"] <- .expr10
##    .hessian[, "g", "g"] <- 2 * (.expr7 * .expr6 * .expr2 + .expr7 *
##        .expr7) * .expr4
##    .hessian[, "g", "logs"] <- .hessian[, "logs", "g"] <- .expr10
##    .grad[, "logs"] <- .expr5
##    .hessian[, "logs", "logs"] <- .expr5
##    attr(.value, "gradient") <- .grad
##    attr(.value, "hessian") <- .hessian
##    .value
##}
##
calcium.vd <- Dvar( calcium.nl )
param( calcium.nl )
##        b0         b1          g       logs 
## 4.3160408  0.2075937  0.3300134 -3.3447585
##
attr( calcium.vd(4.32, 0.208, 0.600, -2.66 ), "gradient" )
##                g      logs
## [1,] -0.11203422 0.1834220
## [2,] -0.11203422 0.1834220
## [3,] -0.11203422 0.1834220
## [4,]  0.09324687 0.3295266
## \dots
##
detach()
}
\keyword{nonlinear}
