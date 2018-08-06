#' Diagnostic Measures for a Linear Regression
#'
#' This function is a wrapper of several diagnostic functions and combines these measures
#' into a single tidy data.frame.
#'
#' @param formula a two-sided regression formula with a single outcome (a 3+ level factor) and predictors
#' @param data the data frame
#' @param ... arguments passed to \code{MASS::polr()}
#'
#' @importFrom stats coef pnorm
#' @importFrom MASS polr
#'
#' @export

glm_olr <- function(formula, data, ...){

  fit <- MASS::polr(formula, data, ...)
  ctable <- stats::coef(summary(fit))
  p <- stats::pnorm(abs(ctable[, "t value"]), lower.tail = FALSE) * 2

  output <- list("coef" = cbind(ctable, "p value" = p),
                 "polr" = fit)
  class(output) <- "glm_olr"
  output
}

#' @export
print.glm_olr <- function(x, ...){

  cat("Ordinal Logistic Regression\n")
  x$coef
  cat("\n---\n")
}

#' @export
coef.glm_olr <- function(object, ...){
  object$coef
}

#' @export
confint.glm_olr <- function(object, parm, level = 0.95, ...){
  confint(object$polr)
}
