#' Multiple Testing Adjustment for Regression
#'
#' Obtain the regression results with a multiple testing adjustment
#'
#' @param model the regression model
#' @param adjustment the type of adjustment
#'
#' @return a data.frame
#'
#' @importFrom stats p.adjust
#'
#' @export
mt_adjust <- function(model, adjustment) {

  coefs <- data.frame(coef(model))
  coefs[[4]] <- stats::p.adjust(coefs[[4]], adjustment)
  coefs

}
