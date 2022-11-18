#' mean_median
#'
#' This function calculates the mean and median of a group of numeric variables.
#'
#' @param x is greater than or equal to 2 numeric variables.
#' @return a vector containing the mean and median of the variables.
#' @examples
#' mean_median(c(2,4,6,8,2,3,10,5))
#' @export
mean_median <-function(x) {
  stopifnot(is.numeric(x))
  mean <-mean(x)
  median <-median(x)
  result <- (c(mean,median))
}

