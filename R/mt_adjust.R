#' Multiple Testing Adjustment for Regression
#'
#' Obtain the regression results with a multiple testing adjustment
#'
#' @param model the regression model
#' @param adjustment the type of adjustment (any that `stats::p.adjust()` can handle)
#'
#' @return a data.frame
#'
#' @importFrom stats p.adjust
#'
#' @export
mt_adjust <- function(model, adjustment) {

  mod <- summary(model)
  coefs <- data.frame(coef(mod))
  coefs[[4]] <- stats::p.adjust(coefs[[4]], adjustment)
  coefs

}
