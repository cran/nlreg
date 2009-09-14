\name{ria}
\docType{data}
\alias{ria}
\title{Radioimmunoassay Data}
\description{
  The \code{ria} data frame has 16 rows and 2 columns.

  Run of a radioimmunoassay (\acronym{RIA}) to estimate the 
  concentrations of a drug in samples of porcine serum.  The 
  experiment consists of 16 observations made at 8 different drug 
  levels with two replications at each level.
}
\usage{data(ria)}
\format{
  This data frame contains the following columns:
  \describe{
    \item{\code{conc}}{
      the drug concentration (ng/ml);
    }
    \item{\code{count}}{
      the observed percentage of radioactive gamma counts.
    }
  }
}
\source{
  The data were obtained from

  Belanger, B. A., Davidian, M. and Giltinan, D. M. (1996) The effect
  of variance function estimation on nonlinear calibration inference 
  in immunoassay data.  \emph{Biometrics}, \bold{52}, 158--175.  
  Table 1, first two columns.
}
\references{
  Brazzale, A. R. (2000) \emph{Practical Small-Sample Parametric 
  Inference}.  Ph.D. Thesis N. 2230, Department of Mathematics, Swiss 
  Federal Institute of Technology Lausanne.  Section 5.3, Example 6.
}
\examples{
data(ria)
attach(ria)
plot(conc, count, xlab="drug concentration (ng/ml)", ylab="gamma counts (\%)")
detach()
}
\keyword{datasets}
