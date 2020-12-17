# # within test-my_knn_cv.R
test_that("my_knn_cv returns a list", {
  my_penguins <- na.omit(my_penguins[, 1:6])
  train <- my_penguins[, 3:6]
  cl <- my_penguins$species
  expect_type(my_knn_cv(train, cl, 1, 5), "list")
})

test_that("negative value for `knn` throws error", {
  my_penguins <- na.omit(penguins[, 1:6])
  train <- my_penguins[, 3:6]
  expect_error(my_knn_cv(train, my_penguins$species, -1, 5))
})
