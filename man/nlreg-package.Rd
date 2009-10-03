\name{nlreg-package}
\Rdversion{1.1}
\alias{nlreg-package}
\docType{package}
\title{
Higher Order Inference for Nonlinear Heteroscedastic Models
}
\description{
Likelihood inference based on higher order approximations
for nonlinear models with possibly non constant variance
}
\details{
\tabular{ll}{
Package: \tab nlreg\cr
Version: \tab 1.2-0\cr
Date: \tab 2009-10-03\cr
URL: \tab http://www.r-project.org, http://statwww.epfl.ch/AA/\cr
Depends: \tab R (>= 2.6.0), statmod, survival\cr
Suggests: \tab boot, cond, csampling, marg\cr
License: \tab GPL (>= 2)\cr
LazyLoad: \tab yes\cr
LazyData: \tab yes\cr
}

Index:
\preformatted{
Functions:
=========
Dmean                   Differentiate the Mean Function of a Nonlinear
                        Model
Dvar                    Differentiate the Variance Function of a
                        Nonlinear Model
contour.all.nlreg.profiles
                        Contour Method for 'nlreg' Objects
expInfo                 Returns the Expected Information Matrix --
                        Generic Function
expInfo.nlreg           Expected Information Matrix for 'nlreg'
                        Objects
logLik.nlreg            Compute the Log Likelihood for Nonlinear
                        Heteroscedastic Models
mpl                     Maximum Adjusted Profile Likelihood Estimation
                        -- Generic Function
mpl.nlreg               Maximum Adjusted Profile Likelihood Estimates
                        for a 'nlreg' Object
mpl.object              Maximum Adjusted Profile Likelihood Object
nlreg                   Fit a Nonlinear Heteroscedastic Model via
                        Maximum Likelihood
nlreg.diag              Nonlinear Heteroscedastic Model Diagnostics
nlreg.object            Nonlinear Heteroscedastic Model Object
obsInfo                 Returns the Observed Information Matrix --
                        Generic Function
obsInfo.nlreg           Observed Information Matrix for 'nlreg'
                        Objects
param                   Extract All Parameters from a Model -- Generic
                        Function
plot.nlreg.contours     Use plot() on a 'nlreg.contours' object
plot.nlreg.diag         Diagnostic Plots for Nonlinear Heteroscedastic
                        Models
plot.nlreg.profile      Use plot() on a 'profile.nlreg' and
                        'all.profiles.nlreg' object
profile.nlreg           Profile Method for 'nlreg' Objects
summary.all.nlreg.profiles
                        Summary Method for Objects of Class
                        'all.nlreg.profiles'
summary.mpl             Summary Method for 'mpl' Objects
summary.nlreg           Summary Method for Nonlinear Heteroscedastic
                        Models
summary.nlreg.profile   Summary Method for Objects of Class
                        'nlreg.profile'
var2cor                 Convert Covariance Matrix to Correlation
                        Matrix -- Generic Function


Datasets:
========
C1                      Herbicide Data (Chlorsulfuron)
C2                      Herbicide Data (Chlorsulfuron)
C3                      Herbicide Data (Chlorsulfuron)
C4                      Herbicide Data (Chlorsulfuron)
M2                      Herbicide Data (Metsulfuron Methyl)
M4                      Herbicide Data (Metsulfuron Methyl)
chlorsulfuron           Chlorsulfuron Data
daphnia                 'Daphnia Magna' Data
helicopter              Paper Helicopter Data
metsulfuron             Metsulfuron Methyl Data
ria                     Radioimmunoassay Data
}

Further information is available in the following vignettes:
\tabular{ll}{
\code{Rnews-paper} \tab hoa: An R Package Bundle for Higher Order Likelihood Inference (source, pdf)\cr
}
}
\author{
S original by Alessandra R. Brazzale <alessandra.brazzale@unimore.it>
and Ruggero Bellio <ruggero.bellio@dss.uniud.it>.  R port by Alessandra R.
Brazzale <alessandra.brazzale@unimore.it>, following earlier work by
Douglas Bates.

Maintainer: Alessandra R. Brazzale <alessandra.brazzale@unimore.it>
}
\keyword{ package }
