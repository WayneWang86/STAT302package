# # within test-my_lm.R
test_that("my_lm returns a table", {
  expect_type(my_lm(mpg ~ hp + wt, mtcars), "list")
})

test_that("input a string rather than data frame for `data`, throws an error", {
  expect_error(my_lm(mpg ~ hp + wt, "string"))
})
