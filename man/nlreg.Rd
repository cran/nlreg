\name{nlreg}
\alias{nlreg}
\title{
  Fit a Nonlinear Heteroscedastic Model via Maximum Likelihood        
}
\description{
  Returns an object of class \code{nlreg} which represents a nonlinear
  heteroscedastic model fit of the data obtained by maximizing the
  corresponding likelihood function.
}
\usage{
nlreg(formula, weights = NULL, data = sys.frame(sys.parent()), start, 
      offset = NULL, subset = NULL, 
      control = list(x.tol = 1e-06, rel.tol = 1e-06, 
                     step.min = 1/2048, maxit = 100), trace = FALSE, 
      hoa = FALSE)
}
\arguments{
  \item{formula}{
    a formula expression as for other nonlinear regression models, of 
    the form \code{response ~ f(predictor)} where \code{f} is a 
    nonlinear function of the predictor involving a number of 
    regression coefficients.  Only one predictor variable can be 
    included in the model formula.  Missing values are not allowed.
  }
  \item{weights}{
    a formula expression of the form \code{~ V(predictor)} where 
    \code{V} is a nonlinear variance function involving the predictor
    or some transformation of it, variance parameters and/or 
    regression coefficients.  The error variance \code{nlreg} works 
    with is
%    \eqn{{\rm Var}(error)=\sigma^2 V(predictor)}
%        {\code{Var(error) = s^2 V(predictor)}}

    \code{Var(error) = s^2 V(predictor)}

    where the constant term \eqn{\sigma^2}{\code{s^2}} is included by 
    default and must
    not be specified in the \code{weights} argument.  The \code{nlreg}
    routine treats it on the logarithmic scale and assigns to it the 
    parameter name \code{logs}.  By default, the error variance is 
    assumed to be constant.
  }
  \item{data}{
    an optional data frame in which to interpret the variables 
    occurring in the model formula.  Missing values are not allowed.
  }
  \item{start}{
    a numerical vector containing the starting values that initialize 
    the iterative estimating procedure.  Each component of the vector 
    must be named and represents one of the parameters included in
    the mean and, if defined, variance function.  Starting values have
    to be supplied for every model parameter, except for the constant
    term in the variance function which is included by default in the
    model.  See the \code{weights} argument above.
  }
  \item{offset}{
    a numerical vector with a single named element.  The name 
    indicates the parameter of interest which will be fixed to the 
    value specified.  \code{logs} is used to identify the constant 
    term \eqn{\sigma^2}{\code{s^2}} which is included by default in the
    variance function.
  }
  \item{subset}{
    expression saying which subset of the rows of the data should be 
    used in the fit.  This can be a logical vector or a numeric vector
    indicating which observation numbers are to be included.  All 
    observations are included by default. 
  }
  \item{control}{
    a list of iteration and algorithmic constants.  See the 
    \bold{Details} section below for their definition. 
  }
  \item{trace}{
    logical flag.  If \code{TRUE}, details of the iterations are 
    printed.  
  }
  \item{hoa}{
    logical flag.  If \code{TRUE}, the first and second derivatives of
    the mean and, if defined, variance functions are stored in the 
    fitted model object.  The default is \code{FALSE}. 
  }
}
\details{
  A nonlinear heteroscedastic model representing the relationship
  between two scalar quantities is fitted.  The response is specified
  on the left-hand side of the \code{formula} argument.  The predictor
  appears in the right-hand side of the \code{formula} and, if 
  specified, \code{weights} arguments.  Only one predictor variable 
  can be included.  Missing values in the data are not allowed.

  The fitting criterion is maximum likelihood.  The core algorithm
  implemented in \code{nlreg} alternates minimization of minus the
  log likelihood with respect to the regression coefficients and the
  variance parameters.  The quasi-Newton optimizer 
  \code{\link[stats]{optim}} is used in both steps.  The constant 
  term \eqn{\sigma^2}{\code{s^2}} in 
%  \eqn{{\rm Var}(error) = \sigma^2 V(predictor)}
%       {\code{Var(error) = s^2 V(predictor)}}
  \code{Var(error) = s^2 V(predictor)} is included by default.  In 
  order to work with a real value, 
  \eqn{\sigma^2}{\code{s^2}} is estimated on the logarithmic scale, 
  that is, the model is reparametrized into 
  \eqn{\log(\sigma^2)}{\code{log(s^2)}} which gives rise to the 
  parameter name \code{logs}.  If the errors are homoscedastic, the 
  second step is omitted and the algorithm switches automatically to
  \code{\link[stats]{nls}}.  If the \code{weights} argument is 
  omitted, homoscedasticity of the errors is assumed.

  Starting values for all parameters have to be passed through the
  \code{start} argument except for \eqn{\sigma^2}{\code{s^2}} for which
  the maximum likelihood estimate is available in closed form.  
  Starting values should be chosen carefully in order to avoid 
  convergence to a local maximum.  

  The algorithm iterates until convergence or until the maximum number
  of iterations defined by \code{maxit} is reached.  The stopping rule
  considers the relative difference between successive estimates and 
  the relative increment of the log likelihood.  These are governed by
  the parameters \code{x.tol} and \code{rel.tol}/\code{step.min}, 
  respectively.

  If convergence has been reached, the results are saved in an object
  of class \code{nlreg}.  The output can be examined by 
  \code{\link[base]{print}} and \code{\link[base]{summary}}.  
  Components can be extracted using \code{\link{coef}},
  \code{\link[nlreg]{param}}, \code{\link[stats:fitted.values]{fitted}} 
  and \code{\link[stats]{residuals}}.  The model fit can be updated using
  \code{\link[stats]{update}}.  Profile plots and profile pair 
  sketches are provided by \code{\link[stats]{profile}}, and 
  \code{\link[graphics]{contour}}.  Diagnostic plots are obtained from
  \code{\link[nlreg:plot.nlreg.diag]{nlreg.diag.plots}} or simply 
  \code{\link[graphics]{plot}}.

  The details are given in \cite{Brazzale (2000, Section 6.3.1)}.
}
\value{
  An object of class \code{nlreg} is returned which inherits from 
  \code{\link[stats]{nls}}.  See \code{\link[nlreg]{nlreg.object}} for
  details.
}
\section{Side Effects}{
  If \code{trace = TRUE}, the iteration number and the corresponding
  log likelihood are printed. 
}
\note{
  The arguments \code{hoa} and \code{control} play an important role.
  The first forces the algorithm to save the derivatives of the mean 
  and variance functions in the fitted model object.  This is 
  imperative if one wants to save execution time, especially for 
  complex models.  Fine-tuning of the \code{control} argument which 
  controls the convergence criteria helps surrounding a well-known
  problem in nonlinear regression, that is, convergence failure in 
  cases where the likelihood is very flat.

  If the errors are homoscedastic, the \code{nlreg} routine switches 
  automatically to \code{\link[stats]{nls}} which, although rarely, 
  dumps because of convergence problems.  To avoid this, either 
  reparametrize the model (see \cite{Bates and Watts, 1988}) or 
  choose starting values that are more realistic.  This advice also
  holds in case of convergence problems for models with non constant
  variance function.  Use the 
  \code{trace = TRUE} argument to gain insight into what goes on at 
  the different iteration steps. 

  The \code{weights} argument has a different meaning than in other 
  model fitting routines such as \code{\link[stats]{lm}} and 
  \code{\link[stats]{glm}}.  It defines the variance function of the 
  nonlinear model and not a vector of observation weights that are 
  multiplied into the squared residuals. 	
}
\references{
  Bates, D. M. and Watts, D. G. (1988) \emph{Nonlinear Regression 
  Analysis and Its Applications}. New York: Wiley.

  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss
  Federal Institute of Technology Lausanne.  

  Seber, G. A. F. and Wild, C. J. (1989) \emph{Nonlinear Regression}.
  New York: Wiley.
}
\seealso{
  \code{\link[nlreg]{nlreg.object}}, \code{\link[stats]{nls}}
} 
\examples{
library(boot)
data(calcium)
##
## Homoscedastic model fit
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), start = c(b0 = 4, b1 = 0.1),
                     data = calcium )
##
## Heteroscedastic model fit 
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), weights = ~ ( 1+time^g )^2,
                     start = c(b0 = 4, b1 = 0.1, g = 1), data = calcium, 
                     hoa = TRUE)
## or
calcium.nl <- update(calcium.nl, weights = ~ (1+time^g)^2, 
                     start = c(b0 = 4, b1 = 0.1, g = 1), hoa = TRUE )
##
##
## Power-of-X (POX) variance function
##
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
##
## Power-of-mean (POM) variance function
##
data(ria)
ria.nl <- nlreg( count ~ b1+(b2-b1) / (1+(conc/b4)^b3), 
                 weights = ~ ( b1+(b2-b1) / (1+(conc/b4)^b3) )^g, data = ria, 
                 start = c(b1 = 1.6, b2 = 20, b3 = 2, b4 = 300, g = 2),
                 hoa = TRUE, trace = TRUE )
##
##
## Error-in-variables (EIV) variance function
##
data(chlorsulfuron)
options( object.size = 10000000 )
chlorsulfuron.nl <- 
    nlreg( log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
        weights = ~ ( 1+k*dose^g*(b2-b1)^2/(1+(dose/b4)^b3)^4*b3^2*dose^(2*b3-2)/
                    b4^(2*b3)/(b1+(b2-b1)/(1+(dose/b4)^b3))^2 ),
        start = c(b1 = 2.2, b2 = 1700, b3 = 2.8, b4 = 0.28, g = 2.7, k = 1), 
        data = chlorsulfuron, hoa = TRUE, trace = TRUE,  
        control = list(x.tol = 10^-12, rel.tol = 10^-12, step.min = 10^-12) )
}
\keyword{regression}
\keyword{nonlinear}
