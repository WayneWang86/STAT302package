[![Travis build status](https://travis-ci.com/WayneWang86/STAT302package.svg?branch=master)](https://travis-ci.com/WayneWang86/STAT302package)
[![Codecov test coverage](https://codecov.io/gh/WayneWang86/STAT302package/branch/master/graph/badge.svg)](https://codecov.io/gh/WayneWang86/STAT302package?branch=master)


## Installation

To download the STAT302package package, use the code below.

``` r
# install.packages("devtools")
devtools::install_github("WayneWang86/STAT302package")
library(STAT302package)
```

## Use

The vignette demonstrates example usage of all main functions. Please [file an issue](https://github.com/WayneWang86/STAT302package/issues) if you have a request for a tutorial that is not currently included. You can see the vignette by using the following code (note that this requires a TeX installation to view properly):

``` r
# install.packages("devtools")
devtools::install_github("WayneWang86/STAT302package", build_vignette = TRUE, build_opts = c())
library(STAT302package)
# Use this to view the vignette in the STAT302package HTML help
help(package = "STAT302package", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "STAT302package")
```
