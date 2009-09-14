\name{nlreg.diag}
\alias{nlreg.diag}
\title{
  Nonlinear Heteroscedastic Model Diagnostics
}
\description{
  Calculates different types of residuals, influence measures and 
  leverages for a nonlinear heteroscedastic model.
}
\usage{
  nlreg.diag(fitted, hoa = TRUE, infl = TRUE, trace = FALSE)
}
\arguments{
  \item{fitted}{
    a \code{nlreg} object, that is, the result of a call to 
    \code{\link[nlreg]{nlreg}}.
  }
  \item{hoa}{
    logical value indicating whether higher order asymptotics should 
    be used for calculating the regression diagnostics.  Default is 
    \code{TRUE}.
  }
  \item{infl}{
    logical value indicating whether influence measures should be
    calculated on the basis of a leave-one-out analysis.  Default is 
    \code{TRUE}.
  }
  \item{trace}{
    logical value.  If \code{TRUE}, details of the iterations are 
    printed.  Default is \code{FALSE}.
  }
}
\details{
  The regression diagnostics implemented in the \code{nlreg.diag} 
  routine follow two approaches.  The first exploits, where possible, 
  the analogy with linear models, that is, it applies the classical 
  definitions of residuals, leverages and Cook's distance after having
  linearized the nonlinear model through Taylor series expansion 
  (\cite{Carroll and Ruppert, 1988, Section 2.8}).  The second 
  approach uses the mean shift outlier model (\cite{Cook and Weisberg,
  1982, Section 2.2.2}), where a dummy variable is included for each 
  observation at a time, the model refitted and the significance of 
  the corresponding coefficient assessed.

  The leverages are defined in analogy to the linear case 
  (\cite{Brazzale, 2000, Appendix A.2.2}).  Two versions are available.
  In the first case the sub-block of the inverse of the expected 
  information matrix corresponding to the regression coefficients is 
  used in the definition.  In the second case, this matrix is replaced 
  by the inverse of \eqn{M'WM}{M'WM}, where \eqn{M}{M} is the 
  \eqn{n\times p}{n x p} matrix whose \eqn{i}{i}th row is the gradient 
  of the mean function evaluated at the ith data point and \eqn{W}{W} 
  is a diagonal matrix whose elements are the inverses of the variance
  function evaluated at each data point.

  If the model is correctly specified, all residuals follow the standard
  normal distribution.  The second kind of leverages described above 
  are used to calculate the approximate studentized residuals, whereas 
  the generalized Pearson residuals use the first kind.  The 
  \eqn{i}{i}th generalized Pearson residual can also be obtained as the
  score statistic for testing the significance of the dummy coefficient
  in the mean shift outlier model for observation \eqn{i}{i}.  
  Accordingly, the \eqn{i}{i}th deletion and \eqn{r^*}{r*}-type 
  residuals are defined as respectively the likelihood root and
  modified likelihood root statistics (\eqn{r}{r} and 
  \eqn{r^*}{r*}) for the same situation (\cite{Bellio, 2000, Section 
  2.6.1}).

  Different influence measures were implemented in 
  \code{nlreg.diag}.  If \code{infl = TRUE}, the global measure 
  (\cite{Cook and Weisberg, 1982, Section 5.2}) and two partial ones 
  (\cite{Bellio, 2000, Section 2.6.2}), the first measuring the 
  influence of each observation on the regression coefficients and the 
  second on the variance parameters, are returned.  They are calculated
  through a leave-one-out analysis, where one observation at a time is 
  deleted and the model refitted.  In order to avoid a further model 
  fit, the constrained maximum likelihood estimates that would be 
  needed are approximated by means of a Taylor series expansion 
  centered at the \acronym{MLE}s.  If \code{infl = FALSE}, only an 
  approximation to Cook's distance, obtained from a first order Taylor 
  series expansion of the partial influence measure for the regression
  coefficients, is returned.

  A detailed account of regression diagnostics can be found in 
  \cite{Davison and Snell (1991)} and \cite{Davison and Tsai (1992)}.  
  The details and in particular the definitions of the above residuals 
  and diagnostics are given in \cite{Brazzale (2000, Section 6.3.1 and 
  Appendix A.2.2)}.
}
\value{
  Returns an object of class \code{nlreg.diag} with the following 
  components:
  \item{fitted}{
    the fitted values, that is, the mean function evaluated at each 
    data point.
  }
  \item{resid}{
    the response (or standardized) residuals from the fit.  
  }
  \item{rp}{
    the generalized Pearson residuals from the fit.
  }
  \item{rs}{
    the approximate studentized residuals from the fit.
  }
  \item{rj}{
    the deletion residuals from the fit; only if \code{hoa = TRUE}.
  }
  \item{rsj}{
    the \eqn{r^*}{r*}-type residuals from the fit; only if 
    \code{hoa = TRUE}.
  }
  \item{h}{
    the leverages of the observations.
  }
  \item{ha}{
    the approximate leverages of the observations.
  }
  \item{cook}{
    an approximation to Cook's distance for the regression 
    coefficients. 
  }
  \item{ld}{
    the global influence of each observation; only for heteroscedastic
    errors and if \code{infl = TRUE}.
  }
  \item{ld.rc}{
    the partial influence of each observation on the estimates of the 
    regression coefficients; only for heteroscedastic errors and if 
    \code{infl = TRUE}.
  }
  \item{ld.vp}{
    the partial influence of each observation on the estimates of the
    variance parameters; only for heteroscedastic errors and if 
    \code{infl = TRUE}.
  }
  \item{npar}{
    the number of regression coefficients.
  }
}
\section{Side Effects}{
  If \code{trace = TRUE}, the number of the observation currently 
  considered in the mean shift outlier model or omitted in the 
  leave-one-out analysis (see \bold{Details} section above) is printed;
  only if \code{hoa = TRUE} or \code{infl = TRUE}.
}
\note{
  The calculation of the deletion and \eqn{r^*}{r*}-type residuals and 
  of the influence measures can be time-consuming.  In the first case, 
  the mean shift outlier model has to be refitted as many times as the 
  total number of observations.  In the second case, the original model
  is refitted the same amount of times, where one observation at a time
  is deleted.  Furthermore, the definition of the \eqn{r^*}{r*}-type 
  residuals 
  requires differentiation of the mean function of the mean shift 
  outlier model.  These calculations can be avoided by changing the 
  default setting of the arguments \code{hoa} and \code{infl} to 
  \code{FALSE}.

  To obtain some of the regression diagnostics (typically those based 
  on higher order statistics), the model is repeatedly refitted for 
  different values of the mean shift outlier model parameter.  Although
  rarely, convergence problems may occur as the starting values are 
  chosen in an automatic way.  A \code{\link[base]{try}} construct is 
  used to prevent the \code{nlreg.diag} method from breaking down.  
  Hence, the values of the diagnostics are not available where a 
  convergence problem was encountered.  A warning is issued whenever 
  this occurs.
}
\section{Acknowledgments}{
  This function is based on A. J. Canty's function 
  \code{\link[boot]{glm.diag}} contained in library \code{boot}.
}
\references{
  Bellio, R. (2000) \emph{Likelihood Asymptotics: Applications in 
  Biostatistics}.  Ph.D. Thesis, Department of Statistics, University 
  of Padova.

  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss 
  Federal Institute of Technology Lausanne.

  Carroll, R. J. and Ruppert, D. (1988) \emph{Transformation and 
  Weighting in Regression}.  London: Chapman & Hall.

  Cook, R. D. and Weisberg, S. (1982) \emph{Residuals and Influence in 
  Regression}.  New York: Chapman & Hall.

  Davison, A. C. and Snell, E. J. (1991) Residuals and diagnostics.  
  In \emph{Statistical Theory and Modelling: In Honour of Sir David 
  Cox} (eds. D. V. Hinkley, N. Reid, and E. J. Snell), 83--106.  
  London: Chapman & Hall.

  Davison, A. C. and Tsai, C.-L. (1992) Regression model diagnostics.  
  \emph{Int. Stat. Rev.}, \bold{60}, 337--353.
}
\seealso{
  \code{\link[nlreg:plot.nlreg.diag]{nlreg.diag.plots}}, 
  \code{\link[nlreg]{nlreg.object}}
}
\examples{
library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), weights = ~ ( 1+time^g )^2, 
                     data=calcium, start = c(b0 = 4, b1 = 0.1, g = 1), 
                     hoa = TRUE )
##
calcium.diag <- nlreg.diag( calcium.nl )
plot( calcium.diag, which = 9 )
##
calcium.diag <- nlreg.diag( calcium.nl, hoa = FALSE, infl = FALSE)
plot(calcium.diag, which = 9)
## Not available
}
\keyword{regression}
\keyword{nonlinear}
