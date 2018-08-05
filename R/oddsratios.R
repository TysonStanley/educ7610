#' Odds Ratios
#'
#' This function provides the exponentiated coefficients and confidence intervals
#' from a logistic regression model.
#'
#' @param model The generalized linear model object (from \code{glm()})
#'
#' @importFrom stats coef confint
#'
#' @export

oddsratios <- function(model){
  cbind("OR" = exp(stats::coef(model)),
        exp(stats::confint(model)))
}
