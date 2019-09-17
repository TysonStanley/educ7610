
# `educ7610`

The goal of `educ7610` is to make several aspects of the Regression
course (EDUC/PSY 7610) at Utah State University more accessible.
Specifically, it provides the data from Darlington and Hayes’ book
“Regression Analysis and Linear Models”, a syntax to perform
diagnostics and Johnson-Neyman, odds ratios from logistic regression,
among other things. In conjunction with packages like `interactions` and
the `easystats` group of packages, this package can make regression
analyses more straightforward.

## Installation

You can install the development version from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("tysonstanley/educ7610")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(educ7610)
#> ── educ7610 0.2.0 ────────────────────────────────────────────────── learn more at tysonbarrett.com ──
#> ✔ educ7610 attached
#> ✔ No potential conflicts found
data("poverty")  ## load the poverty data set

model <- lm(TeenBirth ~ ViolentCrime + poverty_pct,
           data = poverty)
diagnostics(model) %>% head()
#>   TeenBirth ViolentCrime poverty_pct     pred      resid      dfb.1_
#> 1      54.5         11.2        20.1 54.97777 -0.4777688  0.01140240
#> 2      39.5          9.1         7.1 32.93430  6.5656964  0.21476505
#> 3      61.2         10.4        16.1 48.13306 13.0669381 -0.08407140
#> 4      59.9         10.4        14.9 46.17653 13.7234707 -0.01726762
#> 5      41.1         11.2        16.7 49.43426 -8.3342598  0.07141738
#> 6      47.0          5.8         8.8 34.37397 12.6260347  0.29388664
#>       dfb.VlnC    dfb.pvr_       dffit     cov.r       cook.d        hat
#> 1  0.003853716 -0.01434251 -0.01704369 1.1535952 9.888197e-05 0.07683369
#> 2  0.108941094 -0.20044139  0.23370808 1.1046067 1.833345e-02 0.07562858
#> 3 -0.011028702  0.14825406  0.28167070 0.9325356 2.558198e-02 0.02937639
#> 4  0.024749616  0.07786167  0.26245140 0.9118951 2.209091e-02 0.02328784
#> 5  0.002990049 -0.10973056 -0.19000614 1.0324334 1.202486e-02 0.03364566
#> 6  0.062618745 -0.23177500  0.32712068 0.9529815 3.460873e-02 0.04150863
```
