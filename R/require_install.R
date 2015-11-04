#' Installs a required package if not available.
#'
#' @param ... string package name.
#' @return none
#' @export
Require <- function(...){
  if (!require(...)){
    install.packages(...)
    if (!require(...)) stop("Package not found.")
  }
}
