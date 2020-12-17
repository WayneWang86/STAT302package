# # within test-my_rf_cv.R
test_that("my_rf_cv returns a double", {
  expect_type(my_rf_cv(5), "double")
})

test_that("throws an error if the input variable k is less than 0", {
  expect_error(my_rf_cv(-5))
})

