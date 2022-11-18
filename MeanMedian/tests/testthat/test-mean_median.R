#Making a dataframe with NAs to test the function
(dfNA <- data.frame(x = c(1,2,3,6,8,12,15,"NA"),
                  y = c(5,6,7,22,"NA",122,67,9)))

#Making a dataframe without NAs to test the function
(df <- data.frame(x = c(1,2,3,6,8,12,15),
                    y = c(5,6,7,22,122,67,9)))

test_that("mean_median works", {
  expect_error(mean_median(gapminder[c(dfNA,df)]))
  expect_equal(mean_median(df$x), (c(mean(df$x),median(df$x))))
  expect_error(mean_median(dfNA$y))
})
