\name{contour.all.nlreg.profiles}
\alias{contour.all.nlreg.profiles}
\title{
  Contour Method for `nlreg' Objects
}
\description{
  Draws the approximate bivariate contour plots for two or all  
  parameters of a nonlinear heteroscedastic model and, on request,
  returns the list of elements used.
}
\usage{
\method{contour}{all.nlreg.profiles}(x, offset1, offset2, alpha = c(0.1, 0.05),
        stats = c("sk", "fr"), ret = FALSE, plotit = TRUE, 
        drawlabels = FALSE, lwd1 = 1, lwd2 = 1, lty1 = "solid", 
        lty2 = "solid", cl1 = "blue", cl2 = "red", col = "black", 
        pch1 = 1, pch2 = 16, cex = 0.5, \dots)
}
\arguments{
  \item{x}{
    an \code{all.nlreg.profiles} object, that is, the result of a call to 
    \code{\link[nlreg]{profile.nlreg}} with \code{offset = "all"}. 
  }
  \item{offset1, offset2}{
    the two parameters to consider in the approximate bivariate contour
    plots. 
  }
  \item{alpha}{
    a numerical vector defining the levels of the contours; the default
    is \code{c(0.1, 0.05)}, that is, \eqn{1-\alpha=0.9}{1-\code{alpha}=0.9}
    and \eqn{1-\alpha=0.95}{1-\code{alpha}=0.95}. 
  }
  \item{stats}{
    character value indicating which higher order statistics to plot.  
    Admissible values are \code{"sk"} for \cite{Skovgaard's (1996)} 
    proposal and \code{"fr"} for \cite{Fraser, Reid and Wu's (1999)}
    approach.  The default is \code{"sk"}.
  }
  \item{ret}{
    logical value; if \code{TRUE}, a list containing the elements 
    needed to draw the approximate contour plots is 
    returned.  Default is \code{FALSE}.
  }
  \item{plotit}{
    logical value indicating whether to draw the contours.  Default is 
    \code{TRUE}.
  }
  \item{drawlabels}{
    logical value.  Contours are labelled if \code{TRUE}.
  }
  \item{lwd1, lwd2}{
    the line widths used to compare different curves in the same 
    plot; default is \code{lwd2 = 2} for higher order solutions and 
    \code{lwd1 = 1} for first order solutions.
  }
  \item{lty1, lty2}{
    line types used to compare different curves in the same plot; 
    default is \code{"solid"} for all statistics. 
  }
  \item{cl1, cl2, col}{
    colors used to compare different curves in the same plot; default
    is \code{cl2 = "red"} for higher order solutions, and 
    \code{cl1 = "blue"} for the remaining first order statistics.  
    The default color of the plot is \code{col = "black"}.
  }
  \item{pch1, pch2}{
    character types used to compare different values in the same plot; 
    default is \code{pch2 = 16} for higher order solutions, and 
    \code{pch1 = 1} for the remaining first order statistics.  
  }
  \item{cex}{
    the character expansions relative to the standard size of the 
    device to be used for printing text.  The default is 
    \code{cex = 0.5}.
  }
  \item{\dots}{
    absorbs additional arguments such as graphics parameters.
  }
}
\details{
  The function \code{contour.all.nlreg.profiles} calculates all 
  elements needed to draw the profile and approximate bivariate contour
  plots for respectively two parameters of interest and all parameters 
  in the model, depending on whether the \code{offset1} and 
  \code{offset2} arguments are used.

  Contour plots represent the bivariate extension of profile plots.
  Given two parameters of interst, they plot the corresponding joint
  confidence regions of levels \eqn{1-\alpha}{1-\code{alpha}} obtained 
  from the 
  likelihood ratio statistic and the Wald statistic (\cite{Bates and 
  Watts, 1988, Section 6.1.2}).  The closer the two curves are, the 
  more the likelihood surface is quadratic.  Usually profile traces are
  added, that is, the curves showing the constrained maximum likelihood 
  estimates of one parameter as a function of the other, as they 
  provide useful information on how the estimates affect each other.  
  If the asymptotic correlation is zero, the angle between the traces 
  is close to \eqn{\pi/2}{pi/2}.  The calculation of exact contour 
  plots is computationally very intesive, as the model has to be 
  refitted several times to obtain the constrained estimates.  
  \cite{Bates and Watts (1988, Appendix A.6)} present an approximate 
  solution, which only requires the computation of the parameter 
  profiles and which gives rise to the so-called profile pair sketches.

  The function \code{contour.all.nlreg.profiles} extends the classical
  profile plots and profile pair sketches by including the higher order
  solutions \eqn{r^*}{r*} (\cite{Barndorff-Nielsen, 1991}) and
  \eqn{w^*}{w*} (\cite{Skovgaard, 2001}).  The idea is to provide 
  insight into the behaviour of first order methods such as detecting 
  possible bias of the estimates or the influence of the model 
  curvature.  More precisely, the sample space derivatives in 
  \cite{Barndorff-Nielsens' (1991)} \eqn{r^*}{r*} statistic are 
  replaced by respectively the approximations proposed in 
  \cite{Skovgaard (1996)} and \cite{Fraser, Reid and Wu (1999)} 
  depending on the value of the \code{stats} argument.  
  The \eqn{r^*}{r*} statistic is used to calculate an approximation 
  to \cite{Skovgaard's (2001)} \eqn{w^*}{w*} statistic adopting the 
  method by \cite{Bates and Watts (1988, Appendix A.6)}.  This method 
  can break down, if the two 
  parameter estimates are strongly correlated.  The approximate 
  contours of \eqn{w^*}{w*} are then missing in the corresponding 
  panels; four bullets indicate where they intersect the profile 
  traces.

  All necessary quantities are retrieved from the 
  \code{all.nlreg.profiles} object passed through the 
  \code{x} argument.  The \code{offset1} and \code{offset2} arguments 
  can be used to specifiy two parameters of interest, in which case 
  only the profile pair sketches for these two parameters are returned,
  one on the original scale and one on the normal scale.  On the normal
  scale, the units do not express the parameter values themselves, but 
  the associated likelihood root statistics.  (See \cite{Bates 
  and Watts, 1988, Section 6.1.2}, for explanation.)  If the 
  \code{offset1} and \code{offset2} arguments are missing, profile 
  plots and approximate contour plots are drawn for all model
  parameters.  The plots are organized in form of a matrix.  The main 
  diagonal contains the profile plots.  The approximate bivariate 
  contour plots in the lower triangle are plotted on the original 
  scale, whereas the ones in the upper triangle are on the \eqn{r}{r} 
  scale.

  The theory and statistics used are summarized in \cite{Brazzale 
  (2000, Chapters 2 and 3)}.  More details of the implementation are 
  given in \cite{Brazzale (2000, Section 6.3.2)}.
}
\value{
  If \code{ret = TRUE}, a list of class \code{nlreg.contours} is returned
  which contains the elements needed to draw the profiles and approximate 
  bivariate contours for two or all parameters in a nonlinear 
  heteroscedastic model.  Otherwise, no value is returned.
}
\section{Side Effects}{
  If \code{plotit = TRUE}, a plot is produced on the current graphics 
  device.
}
\note{
  \code{contour.all.nlreg.profiles} is a method for the generic 
  function \code{\link[graphics]{contour}} for class 
  \code{all.nlreg.profiles}.  It can be invoked by calling 
  \code{contour} for an object of the appropriate class, or directly 
  by calling \code{contour.all.nlreg.profiles}.  
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

  Skovgaard, I. M (1996) An explicit large-deviation approximation to
  one-parameter tests.  \emph{Bernoulli}, \bold{2}, 145--165.

  Skovgaard, I. M. (2001) Likelihood asymptotics.  \emph{Scandinavian 
  Journal of Statistics}, \bold{28}, 3--32.
}
\seealso{
  \code{\link[nlreg]{nlreg.profile.objects}}, 
  \code{\link[nlreg]{plot.nlreg.contours}},
  \code{\link[graphics]{contour}}
}
\examples{
data(metsulfuron)
metsulfuron.nl <- 
    nlreg( formula = log(area) ~ log( b1+(b2-b1) / (1+(dose/b4)^b3) ), 
           weights = ~ ( 1+dose^exp(g) )^2, data = metsulfuron, 
           start = c(b1 = 138, b2 = 2470, b3 = 2, b4 = 0.07, g = log(0.3)),
           hoa = TRUE )
##
metsulfuron.prof <- profile( metsulfuron.nl, trace = TRUE )
par( mai = rep(0.2, 4) )
contour( metsulfuron.prof )
}
\keyword{methods}
\keyword{nonlinear}
