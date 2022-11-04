Assignment_b1
================
Ariel Rosen
November/4/2022

``` r
#Loading required packages 
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.3.6      ✔ purrr   0.3.4 
    ## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
    ## ✔ tidyr   1.2.1      ✔ stringr 1.4.1 
    ## ✔ readr   2.1.3      ✔ forcats 0.5.2 
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(dplyr)
library(gapminder)
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'
    ## 
    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches
    ## 
    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null
    ## 
    ## The following objects are masked from 'package:readr':
    ## 
    ##     edition_get, local_edition
    ## 
    ## The following object is masked from 'package:tidyr':
    ## 
    ##     matches

**Exercises 1 and 2: Make a Function and Document your Function**

``` r
#' mean_median 
#' This function calculates the mean and median of a group of numeric variables. 
#'
#' @param x is greater than or equal to 2 numeric variables. 
#'
#' @return a vector containing the mean and median of the variables. 
#' 
#' @examples: #Using the function to calculate the mean and median gdp per capita in the gapminder data set
#' mean_median_gdpPercap <- mean_median(gapminder$gdpPercap)

mean_median <-function(x) {
  stopifnot(is.numeric(x))
  mean <-mean(x)
  median <-median(x)
  result <- (c(mean,median))
}
```

**Exercise 3: Include Examples**

``` r
#Using the function to calculate the mean and median gdp per capita in the gapminder data set
(mean_median_gdpPercap <- mean_median(gapminder$gdpPercap))
```

    ## [1] 7215.327 3531.847

``` r
#Using the function to calculate my mean and median grade percentage in STAT 545A
(mean_median_STAT545A <- mean_median(c(100, 100, 67, 100, 95.5, 100)))
```

    ## [1]  93.75 100.00

``` r
#Throwing an error for applying the function to non-numerical variables
(mean_median_error <- mean_median(gapminder$country))
```

    ## Error in mean_median(gapminder$country): is.numeric(x) is not TRUE

``` r
(mean_median_error_2 <- mean_median(c(TRUE, FALSE, TRUE, TRUE)))
```

    ## Error in mean_median(c(TRUE, FALSE, TRUE, TRUE)): is.numeric(x) is not TRUE

**Exercise 4: Test the function**

``` r
#Making a dataframe with NAs to test the function
(df <- data.frame(x = c(1,2,3,6,8,12,15,"NA"), y = c(5,6,7,22,"NA",122,67,9)))
```

    ##    x   y
    ## 1  1   5
    ## 2  2   6
    ## 3  3   7
    ## 4  6  22
    ## 5  8  NA
    ## 6 12 122
    ## 7 15  67
    ## 8 NA   9

``` r
test_that("Testing mean and median function",{
  expect_error(mean_median(gapminder[c('lifeExp', 'pop')]))
  expect_equal(mean_median(gapminder$year), (c(mean(gapminder$year),median(gapminder$year))))
  expect_error(mean_median(df$y))
})
```

    ## Test passed 🎉
