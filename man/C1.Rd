\name{C1}
\docType{data}
\alias{C1}
\alias{C2}
\alias{C3}
\alias{C4}
\alias{M2}
\alias{M4}
\title{Six Herbicide Data Sets}
\description{
  The \code{C1}--\code{C4}, \code{M2} and \code{M4} data frames have
  40 to 72 rows and three columns.
    
  Six bioassay on the action of the herbicides chlorsulfuron and metsulfuron
  methyl on the callus area of colonies of \emph{Brassica napus L}.  The 
  experiments consist of measurements for different dose levels and can be
  balanced (\code{C4}, \code{M2}) or unbalanced (\code{C1}, \code{C2}, \code{C3},
  \code{M4}).
}
\usage{
  data(C1)
  data(C2)
  data(C3)
  data(C4)
  data(M2)
  data(M4)
}
\format{
  These data frame contain the following columns:
  \describe{
    \item{\code{group}}{
      indicator variable for each tested dose;
    }    
    \item{\code{dose}}{
      the tested dose (nmol/l);
    }
    \item{\code{area}}{
      the callus area (\eqn{mm^2}{mm^2}).
    }
  }
}
\source{
  The data were obtained from

  Seiden, P., Kappel, D. and Streibig, J. C. (1998) Response of
  \emph{Brassica napus L.} tissue culture to metsulfuron methyl and
  chlorsulfuron.  \emph{Weed Research}, \bold{38}, 221--228.  
}
\note{
  Data sets \code{C3} and \code{\link[nlreg]{chlorsulfuron}} are the same.
  Data sets \code{M2} and \code{\link[nlreg]{metsulfuron}} are the same.
}
\references{
  Bellio, R., Jensen, J.E. and Seiden, P. (2000).  Applications of 
  likelihood asymptotics for nonlinear regression in herbicide bioassays.
  \emph{Biometrics}, \bold{56}, 1204--1212.

  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss 
  Federal Institute of Technology Lausanne.  Section 5.3, Example 8.
}
\seealso{
  \code{\link[nlreg]{chlorsulfuron}}, \code{\link[nlreg]{metsulfuron}}
} 
\examples{
data(C3)
attach(C3)
plot(dose, area, xlab = "tested dose (nmol/l)", 
     ylab = "log callus area (mm^2)", log = "y")
detach()
}
\keyword{datasets}
