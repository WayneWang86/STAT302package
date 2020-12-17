# within test-my_t.test.R
test_that("function retures a list when the alternative is `two.sided`", {
  data <- rnorm(100, mean=25, sd=10)
  expect_type(my_t.test(data, "two.sided", 15), "list")
})

test_that("function retures a list when the alternative is `less`", {
  data <- rnorm(100, mean=25, sd=10)
  expect_type(my_t.test(data, "less", 15), "list")
})

test_that("function retures a list when the alternative is `greater`", {
  data <- rnorm(100, mean=25, sd=10)
  expect_type(my_t.test(data, "greater", 15), "list")
})

test_that("function retures a list when the alternative is an invalid string value", {
  data <- rnorm(100, mean=25, sd=10)
  expect_error(my_t.test(data, "none", 15))
})
