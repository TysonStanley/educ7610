.onAttach <- function(libname = find.package("educ7610"), pkgname = "educ7610") {

  ## get potential conflicts and filter out unncessary ones
  confs <- search_conflicts() %>%
    do.call("rbind", .) %>%
    .[(!grepl("%>%", rownames(.))) &
        (!grepl("%||%", rownames(.))) &
        (.$rowname != ".GlobalEnv"),] %>%
    data.frame
  if (nrow(confs) == 0){
    confs_msg <- text_col(paste0(crayon::green(cli::symbol$tick), " No potential conflicts found"))
    helper_msg <- ""
  } else {
    confs_msg <- text_col(paste0(crayon::yellow(cli::symbol$cross),
                                 " The educ7610::", rownames(confs), "() function has the same name as ",
                                 gsub("package:", "", confs$rowname), "::", rownames(confs), " (",
                                 sapply(paste0(gsub("package:", "", confs$rowname), "::", rownames(confs)),
                                        function(x) class(eval(parse(text = x)))[1]), ")\n"))
    helper_msg <- text_col(crayon::italic("   Consider using `educ7610::` for each function call."))
  }

  packageStartupMessage(text_col(cli::rule(left = paste0("educ7610 ", rlm_version("educ7610")),
                                           right = "learn more at tysonbarrett.com")),
                        text_col(paste0("\n", crayon::green(cli::symbol$tick), " educ7610 attached\n")),
                        confs_msg,
                        helper_msg)

}

.onLoad <- function(libname = find.package("educ7610"), pkgname = "educ7610"){
  if(getRversion() >= "2.15.1") {
    utils::globalVariables(c(".", "pred", "resid"))
  }
  invisible()
}
