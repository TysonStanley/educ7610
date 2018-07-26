#' Conditional Effects in Interactions
#'
#' Obtain the inferential statistics for a conditional effect
#'
#' @param data the data frame
#' @param formula the formula that works with \code{lm()}
#' @param where a two-sided formula describing a which and where we should do the conditional effect (e.g., \code{x1 ~ x1 - 5} for centering x1 at 5)
#'
#' @return an lm object
#'
#' @importFrom stats lm
#' @importFrom stats setNames
#'
#' @export
cond_effect <- function(data, formula, where = NULL) {

  cond <- paste0(where)
  parsed <- parse(text = paste0(cond[2], " = ", cond[3]))
  data[[cond[2]]] = with(data, eval(parsed))

  fit <- lm(formula, data)
  fit
}

