#' k-Nearest Neighbors Cross-Validation function
#'
#' This function performs a k-nearest neighbors cross-validation.
#' @param train An input data frame as training variables.
#' @param cl  True class value of your training data \code{train}
#' @param k_nn An integer representing the number of neighbors
#' @param k_cv An integer representing the number of folds
#'
#' @keywords prediction
#'
#' @return A list with two objects:
#'   1. \code{class}: A vector of the predicted class Y^i for all observations
#'   2. \code{cv_err}: A numeric value with the cross-validation misclassification error
#'
#' @import class magrittr stats tidyverse
#'
#' @examples
#' penguins <- na.omit(my_penguins[, 1:6])
#' train <- penguins[, 3:6]
#' my_knn_cv(train, penguins$species, 1, 5)
#'
#' @export
#'
#'
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  fold <- sample(rep(1:k_cv, length = length(cl)))
  data <- data.frame("x" = train, "y" = cl, "split" = fold)
  # Create a matrix to hold the predicted class for all observations
  pred_mat <- matrix(NA, length(cl))
  # Store the cross-validation misclassification error for each fold
  cv_err <- rep(NA, k_cv)

  for (i in 1:k_cv) {
    # Use one fold as test data while using all other folds as the training data.
    data_train <- data %>% dplyr::filter(split != i)
    data_test <- data %>% dplyr::filter(split == i)
    # predict the class of the ith fold
    y_hat <- knn(data_train %>% dplyr::select(starts_with("x.")),
                 data_test %>% dplyr::select(starts_with("x.")),
                 data_train$y, k_nn)

    # Add prediction to class vector
    pred_mat[fold == i, 1] <- as.character(y_hat)
    # Calculate the
    cv_err[i] <- sum(y_hat != data_test$y) / length(data_test$y)
  }
  output <- list("class" = pred_mat[, 1], "cv_err" = mean(cv_err))
  return(output)
}

