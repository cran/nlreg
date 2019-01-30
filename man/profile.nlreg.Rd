\name{profile.nlreg}
\alias{profile.nlreg}
\title{
  Profile Method for `nlreg' Objects
}
\description{
  Returns a list of elements for profiling a nonlinear heteroscedastic
  model. 
}
\usage{
\method{profile}{nlreg}(fitted, offset = "all", hoa = TRUE, precision = 6, 
        signif = 30, n = 50, omit = 0.5, trace = FALSE, md, vd, 
        all = FALSE, \dots)
}
\arguments{
  \item{fitted}{
    a fitted \code{nlreg} object such as returned by a call to 
    \code{\link[nlreg]{nlreg}}.
  }
  \item{offset}{
    a single named element representing the parameter of interest (a
    regression coefficient or a variance parameter), or \code{"all"} if
    all parameters are to be profiled, provided that the model formula
    contains more than one regression coefficient.  The constant term 
    \eqn{\log(\sigma^2)}{\code{log(s^2)}} which is included by default 
    in the variance function is referred to by \code{logs} (see the 
    \code{weights} argument in \code{\link[nlreg]{nlreg}}).  The 
    default is \code{"all"}.
  }
  \item{hoa}{
    logical value indicating whether higher order statistics should be
    included; the default is \code{TRUE}.
  }
  \item{precision}{
    numerical value defining the maximum range of values, given by 
    \acronym{MLE} \eqn{\pm}{+/-} 
    \code{precision}\eqn{*}{*}\acronym{s.e.}, that are profiled.  The 
    default is 6.
  }
  \item{signif}{
    the maximum number of output points that are calculated exactly; 
    the default is 30. 
  }
  \item{n}{
    the approximate number of output points produced by the spline
    interpolation; the default is 50.
  }
  \item{omit}{
    numerical value defining the range of values, given by 
    \acronym{MLE} \eqn{\pm}{+/-} \code{omit}\eqn{*}{*}\acronym{s.e}, 
    which is omitted in the spline interpolation of the higher order 
    statistics.  The purpose is to avoid numerical instabilities around
    the maximum likelihood estimate.
  }
  \item{trace}{
    if \code{TRUE}, details of the iterations are printed.
  }
  \item{md}{
    a function definition that returns the first two derivatives of the
    mean function; used by \code{\link[nlreg]{allProfiles.nlreg}}.  
  }
  \item{vd}{
    a function definition that returns the first two derivatives of the
    variance function; used by \code{\link[nlreg]{allProfiles.nlreg}}. 
  }
  \item{all}{
    logical switch used by \code{\link[nlreg]{allProfiles.nlreg}}.  
  }
  \item{\dots}{
    absorbs any additional argument.
  }
}
\details{
  The function \code{profile.nlreg} calculates all elements necessary 
  for profiling a scalar parameter of interest or all model parameters.
  The model formula must contain more than one regression coefficient.

  A classical profile plot (\cite{Bates and Watts, 1988, Section 
  6.1.2}) is a plot of the likelihood root statistic and of the
  Wald statistic against a range of values for the interest parameter.
  It provides a means to assess the accuracy of the normal 
  approximation to the distribution of both statistics: the closer the 
  corresponding curves are, the better the approximations.  Confidence 
  intervals can easily be read off for any desired level: the 
  confidence bounds identify with the values on the \eqn{x}{x}-axis at 
  which the
  curves intersect the horizontal lines representing the standard 
  normal quantiles of the desired level.

  Profiling is performed by updating a fitted nonlinear heteroscedastic
  model.  All statistics are calculated exactly for at maximum
  \code{signif} equally spaced points distributed around the 
  \acronym{MLE}.  To save execution time, the iterations start with a 
  value close to the \acronym{MLE} and proceed in the two directions 
  \acronym{MLE} \eqn{\pm}{+/-} \eqn{\delta}{\emph{delta}}, until the 
  absolute value of all statistics exceeds the threshold 2.4.  The 
  step size \eqn{\delta}{\emph{delta}} is defined by the \code{signif} 
  argument.  A spline interpolation is used to extend them over the 
  whole interval of interest.  A range of values, defined by the 
  \code{omit} argument is omitted to avoid numerical instabilities 
  around the \acronym{MLE}.  All results are stored in an  object of
  class \code{nlreg.profile} or \code{all.nlreg.profiles} depending on 
  the value assumed by the \code{offset} argument.  The 
  \code{\link[base]{summary}} and \code{\link[graphics]{plot}} method 
  functions must be used to examine the output or represent it 
  graphically.  No \code{print} method is available.

  If \code{hoa = TRUE}, \code{profile.nlreg} produces an enhanced
  version of the classical profile plots by including the third order
  modified likelihood root statistic \eqn{r^*}{r*}.  More
  precisely, it implements two approximations to
  \cite{Barndorff-Nielsens's (1991)} original formulation where the
  sample space derivatives are replaced by respectively the
  approximations proposed in \cite{Skovgaard (1996)} and \cite{Fraser, 
  Reid and Wu (1999)}.  The idea is to provide insight into the behaviour 
  of first order methods, such as detecting possible bias of the estimates 
  or the influence of the model curvature.

  The theory and statistics used are summarized in \cite{Brazzale 
  (2000, Chapters 2 and 3)}.  More details of the implementation are 
  given in \cite{Brazzale (1999; 2000, Section 6.3.2)}.
}
\value{
  a list of elements of class \code{nlreg.profile} or, if 
  \code{offset = "all"}, of class \code{all.nlreg.profiles} for 
  profiling a nonlinear heteroscedastic model.  The 
  \code{nlreg.profile} class considers a scalar parameter of interest,
  while the \code{all.nlreg.profiles} class ontains the profiles of all
  parameters -- regression coefficients and variance parameters.
}
\section{Side Effects}{
  If \code{trace = TRUE}, the parameter which is currently profiled and
  the corresponding value are printed.
}
\note{
  \code{profile.nlreg} is a method for the generic function 
  \code{\link[stats]{profile}} for class \code{nlreg}.  It can be 
  invoked by calling \code{profile} for an object of the 
  appropriate class, or directly by calling \code{profile.nlreg}.  

  To obtain the profiles of the different statistics considered, the 
  model is refitted several times while keeping the value of the 
  parameter of interest fixed.  Although rarely, convergence problems 
  may occur as the starting values are chosen in an automatic way.  A 
  \code{\link[base]{try}} construct is used to prevent the 
  \code{profile.nlreg} method from breaking down.  Hence, the values 
  of the statistics are not available where a convergence problem was 
  encountered.  A warning is issued whenever this occurs.  
}
\references{
  Barndorff-Nielsen, O. E. (1991) Modified signed log likelihood ratio.
  \emph{Biometrika}, \bold{78}, 557--564.

  Bates, D. M. and Watts, D. G. (1988) \emph{Nonlinear Regression 
  Analysis and Its Applications}.  New York: Wiley.

  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss 
  Federal Institute of Technology Lausanne.
 
  Fraser, D.A.S., Reid, N. and Wu, J. (1999).  A simple general formula 
  for tail probabilities for frequentist and Bayesian inference. 
  \emph{Biometrika}, \bold{86}, 249--264.

  Skovgaard, I.  (1996) An explicit large-deviation approximation to
  one-parameter tests.  \emph{Bernoulli}, \bold{2}, 145--165.
}
\seealso{
  \code{\link{nlreg.profile.object}}, 
  \code{\link{all.nlreg.profiles.object}},
  \code{\link[stats]{profile}} 
}
\examples{
\dontrun{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
metsulfuron.prof <- profile( metsulfuron.nl, offset = g, trace = TRUE )
plot( metsulfuron.prof, lwd2 = 2 )
#
metsulfuron.prof <- profile( metsulfuron.nl, trace = TRUE )
plot( metsulfuron.prof, nframe = c(2,3), lwd2 = 2 )}
}
\keyword{regression}
\keyword{nonlinear}
\keyword{methods}
