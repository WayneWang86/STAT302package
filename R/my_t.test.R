#' t-test function
#'
#' my_t.test() function performs a one sample t-test in R.
#'
#' @param x A numeric vector of data.
#' @param alternative A character string specifying the alternative hypothesis.
#'   This should only accept "two.sided", "less", or "greater". Otherwise,
#'   the function throw an informative error.
#' @param mu A number indicating the null hypothesis value of the mean.
#'
#' @keywords inference
#'
#' @return A list with elements,which includes
#'   \code{test_stat}: the numeric test statistic.
#'   \code{df}: the degrees of freedom.
#'   \code{alternative}: the value of the parameter \code{alternative}.
#'   \code{p_val}: the numeric p-value.
#'
#' @examples
#' data <- rnorm(100, mean=25, sd=10)
#' my_t.test(data, "two.sided", 15)
#' my_t.test(data, "less", 15)
#' my_t.test(data, "greater", 15)
#'
#'
#' @export
my_t.test <- function(x, alternative, mu) {
  alternative_options <- c("two.sided", "less", "greater")
  # Throw an informative error if the alternative is not "two.sided", "less" or "more"
  if (!alternative %in% alternative_options) {
    stop("The value of alternative can't be identified, only \"two.sided\"
         \"less\" and \"more\" are accepted for alternative")
  }

  # Calculate the stats needed for t-test
  s_e <- sd(x) / sqrt(length(x))
  df <- length(x) - 1
  mean <- mean(x)
  t_val <- (mean - mu) / s_e

  # Calculate p-values based on conditions
  if (alternative == "less") {
    p_val <- pt(t_val, df, lower.tail = TRUE)
  } else if (alternative == "greater") {
    p_val <- pt(t_val, df, lower.tail = FALSE)
  } else {
    p_val <- 2 * pt(abs(t_val), df, lower.tail = FALSE)
  }

  # Gather info and return
  result <- list("test_stat" = t_val, "df" = df,
                 "alternative" = alternative, "p_val" = p_val)
  return(result)
}
