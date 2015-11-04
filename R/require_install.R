#' Installs a required package if not available.
#'
#' @param package string package name
#' @param ... additional options passed on to \code{\link{install.packages}}.
#' @return none
#' @export
Require <- function(package, ...){
  if (!require(package)){
    install.packages(package, ...)
    if (!require(package))
      stop("Package not found.")
  }
}
