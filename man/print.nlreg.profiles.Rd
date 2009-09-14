\name{print.nlreg.profiles}
\alias{print.nlreg.profiles}
\alias{print.nlreg.profile}
\alias{print.all.nlreg.profiles}
\title{
  Use print() on a `nlreg.profile' and `all.nlreg.profiles' object
}
\description{
  Objects of class \code{nlreg.profile} and 
  \code{all.nlreg.profiles} have no proper \code{print} method.  
  They are plotted instead.  See 
  \code{\link[nlreg:plot.nlreg.profiles]{plot.nlreg.profile}} and
  \code{\link[nlreg:plot.nlreg.profiles]{plot.all.nlreg.profiles}} 
  for details.
}
\usage{
\method{print}{nlreg.profile}(x, \dots)
\method{print}{all.nlreg.profiles}(x, \dots)
}
\synopsis{
\method{plot}{nlreg.profile}(x = stop("nothing to plot"), alpha = 0.05, add.leg = FALSE, stats = c("sk", "fr"),
     cex = 0.7, cex.lab = 1, cex.axis = 1, cex.main = 1, lwd1 = 1, lwd2 = 2, 
     lty1 = "solid", lty2 = "solid", cl1 = "blue", cl2 = "red", col = "black", 
     ylim = c(-3,3), \dots)
\method{plot}{all.nlreg.profiles}(x = stop("nothing to plot"), nframe, alpha = 0.05, stats = c("sk", "fr"),
     cex = 0.7, cex.lab = 1, cex.axis = 1, cex.main = 1, lwd1 = 1, lwd2 = 2, 
     lty1 = "solid", lty2 = "solid", cl1 = "blue", cl2 = "red", col = "black", 
     ylim = c(-3,3), \dots)
}
\seealso{
  \code{\link[nlreg]{nlreg.profile.objects}}, 
  \code{\link[nlreg:plot.nlreg.profiles]{plot.nlreg.profile}},
  \code{\link[nlreg:plot.nlreg.profiles]{plot.all.nlreg.profiles}}
}
\keyword{internal}
\keyword{methods}
\keyword{print}
