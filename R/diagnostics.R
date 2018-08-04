#' Diagnostic Measures for a Linear Regression
#'
#' This function is a wrapper of several diagnostic functions and combines these measures
#' into a single tidy data.frame.
#'
#' @param model The linear model object (\code{lm()} or \code{glm()})
#'
#' @importFrom stats influence.measures cooks.distance predict resid
#' @import dplyr
#'
#' @export

diagnostics <- function(model){

  ## Data frame
  data <- model$model

  ## Obtaining and combining measures
  influences <- stats::influence.measures(model)
  cooks <- stats::cooks.distance(model)
  data %>%
    dplyr::mutate(pred = stats::predict(model),
                  resid = stats::resid(model)) %>%
    dplyr::bind_cols(influences, cooks)
}

