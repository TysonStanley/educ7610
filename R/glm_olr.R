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

  m <- match.call()

  ## For pipes
  if (m$data == "."){
    data <- data
    m$data <- substitute(data)
  }

  ## Use MASS::polr for the evaluation
  m[[1L]] <- quote(MASS::polr)
  fit <- eval.parent(m)

  coefs <- stats::coef(summary(fit))
  p <- stats::pnorm(abs(coefs[, "t value"]), lower.tail = FALSE) * 2

  output <- list("results" = cbind(coefs, "p value" = p),
                 "polr"    = fit,
                 "coef"    = fit$coef)
  class(output) <- "glm_olr"
  output
}


#' @export
print.glm_olr <- function(x, ...){

  cat("Ordinal Logistic Regression\n")
  print.default(round(x[["results"]], 5))
  cat("---\n")

}

#' @export
coef.glm_olr <- function(object, ...){
  object$coef
}

#' @export
confint.glm_olr <- function(object, parm, level = 0.95, ...){
  confint(object$polr)
}
