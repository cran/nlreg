\name{plot.nlreg.diag}
\alias{plot.nlreg.diag}
\alias{nlreg.diag.plots}
\title{
  Diagnostic Plots for Nonlinear Heteroscedastic Models
}
\description{
  The \code{nlreg.diag.plots} routine generates diagnostic plots for a 
  nonlinear heteroscedastic model using different types of residuals, 
  influence measures and leverages.  This is equivalent to using the 
  \code{plot.nlreg.diag} method for function 
  \code{\link[graphics]{plot}} for objects inheriting from class 
  \code{nlreg.diag}.  
}
\usage{
nlreg.diag.plots(fitted, which = "all", subset = NULL, iden = FALSE, 
                 labels = NULL, hoa = TRUE, infl = TRUE, 
                 trace = FALSE, ret = FALSE, \dots)
\method{plot}{nlreg.diag}(x, which = "all", subset = NULL, iden = FALSE, labels = NULL, 
     \dots)
}
\arguments{
  \item{fitted}{
    either a \code{nlreg} object, that is, the result of a call to 
    \code{\link[nlreg]{nlreg}}, or a \code{nlreg.diag} object obtained 
    from a call to \code{\link[nlreg]{nlreg.diag}}.
  }
  \item{x}{
    a \code{nlreg.diag} object obtained from a call to 
    \code{\link[nlreg]{nlreg.diag}}.
  }
  \item{which}{
    which plot to draw.  Admissible values are \code{2} to \code{9} 
    which correspond to the choices below.  The default is 
    \code{"all"}, which pops up a menu that lists all available plots.
  }
  \item{subset}{
    the subset of the data used in the original \code{nlreg} fit.  Must
    be the same than the \code{subset} option used in the call to 
    \code{nlreg} that generated the \code{nlreg} object for which the
    diagnostic plots are to be drawn.  Needed only if the \code{subset}
    option is used in the call to \code{nlreg}.
  }
  \item{iden}{
    logical argument.  If \code{TRUE}, the user will be prompted after 
    the plots are drawn.  A positive integer will select a plot and 
    invoke \code{\link[graphics]{identify}()} on that plot.  After 
    exiting \code{identify}, the user is again prompted, this loop 
    continuing until the user responds to the prompt with \code{0}.  If
    \code{iden} is \code{FALSE} (default) the user cannot interact with
    the plots.
  }
  \item{labels}{
    a vector of labels for use with \code{identify} if \code{iden} is
    \code{TRUE}.  If it is not supplied, the labels are derived 
    from the \code{nlreg.diag} object argument \code{fitted} or 
    \code{x}.
  }
  \item{hoa}{
    logical value indicating whether higher order asymptotics should be
    used for calculating the regression diagnostics.  Needed only if
    \code{fitted} is a \code{nlreg} object.  Default is \code{TRUE}.
  }
  \item{infl}{
    logical value indicating whether influence measures should be
    calculated on the basis of a leave-one-out analysis.  Needed only 
    if \code{fitted} is a \code{nlreg} object.  Default is \code{TRUE}.
  }
  \item{trace}{
    logical value.  If \code{TRUE} details of the iterations are 
    printed.  Needed only if \code{fitted} is a \code{nlreg} object.  
    Default is \code{FALSE}.
  }
  \item{ret}{
    logical argument indicating whether the \code{nlreg.diag} object 
    should be returned; the default is \code{FALSE}.
  }
  \item{\dots}{
    additional graphics parameters.
  }
}
\details{
  The diagnostics required for the plots are calculated by 
  \code{\link[nlreg]{nlreg.diag}}, either by passing a 
  \code{nlreg.diag} object or by applying \code{nlreg.diag} 
  internally to the \code{nlreg} object specified through \code{fitted}.   
  These are then used to produce the plots on the current graphics 
  device.  A menu lists all possible choices.  They may be one or all 
  of the following.
  \preformatted{
 Make a plot selection (or 0 to exit)

1:plot: Summary
2:plot: Studentized residuals against fitted values
3:plot: r* residuals against fitted values
4:plot: Normal QQ-plot of studentized residuals
5:plot: Normal QQ-plot of r* residuals
6:plot: Cook statistic against h/(1-h)
7:plot: Global influence against h/(1-h)
8:plot: Cook statistic against observation number
9:plot: Influence measures against observation number

Selection:
}
  In the normal scores plots, the dotted line represents the expected 
  line if the residuals are normally distributed, that is, it is the line 
  with intercept 0 and slope 1.

  In general, when plotting Cook's distance or the global influence
  measure against the standardized leverages, there will be two dotted
  lines on the plot.  The horizontal line is at 
  \eqn{8/(n-2p)}{8/(n-2p)}, where \eqn{n}{n} is the number of 
  observations and \eqn{p}{p} is the number of regression coefficients 
  estimated.  Points above this line may be points with high influence 
  on the model.  The vertical line is at \eqn{2p/(n-2p)}{2p/(n-2p)} and
  points to the right of this line have high leverage compared to the
  variance of the raw residual at that point.  If all points are below
  the  horizontal line or to the left of the vertical line then the 
  line is not shown.

  Use of \code{iden = TRUE} is encouraged for proper exploration of 
  these plots as a guide to how well the model fits the data and 
  whether certain observations have an unduly large effect on parameter
  estimates. 
}
\value{
  If \code{ret = TRUE}, the \code{nlreg.diag} object is returned.  
  Otherwise, there is no returned value.
}
\section{Side Effects}{
  The current device is cleared.  If \code{iden = TRUE}, interactive 
  identification of points is enabled.  All screens are closed, but not
  cleared, on termination of the function.  
}
\note{
  Choices \code{3} and \code{5} are not available if \code{hoa = FALSE}
  in the call to \code{\link[nlreg]{nlreg.diag}} that generated the 
  \code{x} argument.  
  Choices \code{7} and \code{9} are not available if 
  \code{infl = FALSE} in the same call.  Plot number \code{9} is 
  furthermore not available if the variance function is constant.
}
\section{Acknowledgments}{
  This function is based on A. J. Canty's function 
  \code{\link[boot]{glm.diag.plots}} contained in library \code{boot}.
}
\references{
  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss 
  Federal Institute of Technology Lausanne.  Section 6.3.1 and 
  Appendix A.2.2.

  Davison, A. C. and Snell, E. J. (1991) Residuals and diagnostics.  In
  \emph{Statistical Theory and Modelling: In Honour of Sir David Cox}
  (eds. D. V. Hinkley, N. Reid, and E. J. Snell), 83--106.  London:
  Chapman & Hall.

  Davison, A. C. and Tsai, C.-L. (1992) Regression model diagnostics.  
  \emph{Int. Stat. Rev.}, \bold{60}, 337--353.
}
\seealso{
  \code{\link[nlreg]{nlreg.diag}}, \code{\link[nlreg]{nlreg.object}}, 
  \code{\link{identify}}
}
\examples{
library(boot)
data(calcium)
calcium.nl <- nlreg( cal ~ b0*(1-exp(-b1*time)), weights = ~ ( 1+time^g )^2, 
                     start = c(b0 = 4, b1 = 0.1, g = 1), data = calcium, 
                     hoa = TRUE )
##
calcium.diag <- nlreg.diag( calcium.nl, trace = TRUE )
##
## menu-driven
\dontrun{
plot( calcium.diag )
##
##  Make a plot selection (or 0 to exit)
##
## 1:plot: Summary
## 2:plot: Studentized residuals against fitted values
## 3:plot: r* residuals against fitted values
## 4:plot: Normal QQ-plot of studentized residuals
## 5:plot: Normal QQ-plot of r* residuals
## 6:plot: Cook statistic against h/(1-h)
## 7:plot: Global influence against h/(1-h)
## 8:plot: Cook statistic against observation number
## 9:plot: Influence measures against observation number
##
## Selection:}
##
## plot 5: Normal QQ-plot of r* residuals
plot( calcium.diag, which = 5, las = 1 )
##
nlreg.diag.plots( calcium.nl, which = 5, las = 1 )
}
\keyword{regression}
\keyword{nonlinear}
\keyword{methods}
\keyword{hplot}
