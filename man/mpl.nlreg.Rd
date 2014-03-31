\name{mpl.nlreg}
\alias{mpl.nlreg}
\title{
  Maximum Adjusted Profile Likelihood Estimates for a `nlreg' Object
}
\description{
  Calculates the maximum adjusted profile likelihood estimates of the
  variance parameters for a nonlinear heteroscedastic model.
}
\usage{
\method{mpl}{nlreg}(fitted, offset = NULL, stats = c("sk", "fr"), 
    control = list(x.tol = 1e-6, rel.tol = 1e-6, step.min = 1/2048,
    maxit = 100), trace = FALSE, \dots )
}
\arguments{
  \item{fitted}{
    a \code{nlreg} object, that is, the result of a call to 
    \code{\link[nlreg]{nlreg}} with non-constant variance function.
  }
  \item{offset}{
    a numerical vector whose elements are named after the variance
    parameters appearing in the nonlinear model.  These will be fixed 
    to the values specified in \code{offset}.  The name \code{logs} is 
    used to identify the constant term 
    \eqn{\log(\sigma^2)}{\code{log(s^2)}} which is included by default 
    in the variance function (see the \code{weights} argument in 
    \code{\link[nlreg]{nlreg}}).  The default is \code{NULL}.
  }
  \item{stats}{
    character value indicating which correction term to use.  
    Admissible values are \code{"sk"} for \cite{Skovgaard's (1996)} 
    proposal and \code{"fr"} for \cite{Fraser, Reid and Wu's (1999)}
    approach.  The default is \code{"sk"}.
  }
  \item{control}{
    a list of iteration and algorithmic constants.  See the 
    \bold{Details} section below for their definition.
  }
  \item{trace}{
    logical flag.  If \code{TRUE}, details of the iterations are 
    printed. Default is \code{FALSE}.
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  The \code{mpl.nlreg} routine returns nearly unbiased estimates of the
  variance parameters of a nonlinear heteroscedastic regression model 
  by maximizing the corresponding adjusted profile likelihood
  (\cite{Barndorff-Nielsen, 1983}).  More precisely, it implements two 
  approximations derived from the theories developed respectively by 
  \cite{Skovgaard (1996)} and \cite{Fraser, Reid and Wu (1999)}. The 
  core algorithm alternates 
  minimization of minus the adjusted profile log likelihood with 
  respect to the variance parameters, and minimization of minus the 
  profile log likelihood with respect to the regression coefficients.  
  The first step is omitted if the \code{offset} argument is used in 
  which case \code{mpl.nlreg} returns the constrained maximum 
  likelihood estimates of the regression coefficients.  The 
  quasi-Newton optimizer \code{\link[stats]{optim}} is used in both 
  steps.  Starting values are retrieved from the \code{nlreg} object
  passed through the \code{fitted} argument.

  The algorithm iterates until convergence or until the maximum number
  of iterations is reached.  The stopping rule considers the relative
  difference between successive estimates of the variance parameters 
  and the relative increment of the adjusted profile log likelihood.  
  These are governed by the parameters \code{x.tol} and 
  \code{rel.tol}/\code{step.min}, respectively.
  If the \code{offset} argument is used, the relative difference 
  between successive estimates of the regression coefficients and the 
  relative increment of the profile log likelihood are considered 
  instead.  If convergence has been reached, the results are saved in 
  an object of class \code{mpl}.  The output can be examined by 
  \code{\link[base]{print}} and \code{\link[base]{summary}}.
  Components can be extracted using \code{\link{coef}} and 
  \code{\link[nlreg]{param}}.

  The theory is outlined in \cite{Brazzale (2000, Sections 3.1 and 
  3.2.3)}.  Details of the implementation are given in \cite{Brazzale 
  (2000, Section 6.3.1)}.
}
\value{
  an object of class \code{mpl} which inherits from \code{nlreg}.  
  See \code{\link[nlreg]{mpl.object}} for details.
}
\section{Side Effects}{
  If \code{trace = TRUE} and \code{offset = NULL}, the iteration number
  and the corresponding adjusted profile log likelihood are printed. 
}
\note{
  The argument \code{control} which controls the convergence criteria 
  plays an important role.  Fine-tuning of this argument helps 
  surrounding a well-known problem in nonlinear regression, that is,
  convergence failure in cases where the likelihood and/or the adjusted 
  profile likelihood are very flat.
}
\references{
  Barndorff-Nielsen, O. E. (1983) On a formula for the distribution of
  the maximum likelihood estimator.  \emph{Biometrika}, \bold{70}, 
  343--365.

  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}. Ph.D. Thesis N. 2230, Department of Mathematics, Swiss
  Federal Institute of Technology Lausanne.  

  Fraser, D.A.S., Reid, N. and Wu, J. (1999).  A simple general formula 
  for tail probabilities for frequentist and Bayesian inference. 
  \emph{Biometrika}, \bold{86}, 249--264.

  Skovgaard, I.  (1996) An explicit large-deviation approximation to
  one-parameter tests.  \emph{Bernoulli}, \bold{2}, 145--165.
}
\seealso{
  \code{\link[nlreg]{mpl}}, \code{\link[nlreg]{mpl.object}}, 
  \code{\link[nlreg]{nlreg.object}}, \code{\link[stats]{optim}}
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, hoa = TRUE, 
          start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)) )
##
## MMPLE of the variance parameters
##
metsulfuron.mpl <- mpl( metsulfuron.nl, trace = TRUE )
summary( metsulfuron.mpl, corr = FALSE )
##
## constrained MLEs of the regression coefficients  
##
metsulfuron.mpl <- mpl( metsulfuron.nl, offset = metsulfuron.nl$varPar, 
                        trace = TRUE )
summary( metsulfuron.mpl, corr = FALSE )
}
\keyword{regression}
\keyword{nonlinear}
\keyword{methods}
