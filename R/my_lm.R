#' Linear model function
#'
#' function my_lm() fits a linear model in R.
#'
#' @param formula: A formula class object
#' @param data: Input data frame.
#'
#' @keywords prediction
#'
#' @return A table with rows for each coefficient (including the Intercept!) and
#'   columns for the Estimate, Std. Error, t value, and Pr(>|t|).
#'
#' @examples
#'  my_lm(mpg ~ hp + wt,mtcars)
#'
#' @export

my_lm <- function(formula, data) {
  # Extract model matrix X
  independent_var_x <- model.matrix(formula, data)
  # Ectract model response Y
  dependent_var_y <- model.response(model.frame(formula, data))
  # solve for the extimated coefficients
  est_coef <- solve(t(independent_var_x) %*% independent_var_x) %*%
    t(independent_var_x) %*% dependent_var_y
  df <- nrow(data) - length(est_coef)

  # calculate estimated variance
  variance <- sum((dependent_var_y - (independent_var_x %*% est_coef)) ** 2) / df

  # calculate the estimated standard error
  se <- sqrt(diag(variance * solve(t(independent_var_x) %*% independent_var_x)))

  # calculate t-score
  t_score <- est_coef / se

  # calculate p value
  p <- 2 * pt(abs(t_score), df, lower.tail = FALSE)

  output <- data.frame("Estimate" = est_coef,
                       "Std. Error" = se,
                       "t value" = t_score,
                       "Pr[>|t|]" = p)
  return(output)
}
