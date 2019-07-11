utils::globalVariables(c('time', 'strata', 'n.risk'))

#' @title Create a ggplot2 table showing the number at risk
#' @description A simple wrapper function which calculates the
#' numbers at risk for a survival model and a given set of time points then
#' creates a ggplot2 table with them.
#' @param fit Required. survival::survfit() object.
#' @param times Required. Numeric. One or more time points to calculate
#' the number at risk for.
#' @return An unformatted ggplot2 table showing the number at risk.
#' @examples
#' library(survival)
#'
#' fit <- survfit(Surv(time, status) ~ trt, data = diabetic)
#'
#' ggrisktable(fit, c(0, 10, 20, 30, 40, 50)) +
#'   theme_risk_black()
#' @export
ggrisktable <- function (fit, times) {
  ggplot2::ggplot(
    utile.tools::tabulate_at_risk(fit, times),
    ggplot2::aes(x = time, y = strata, label = n.risk)
  ) + ggplot2::geom_text()
}
