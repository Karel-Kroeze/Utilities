#' Installs a required package if not available.
#'
#' @param ... string package name.
#' @param github string representation of github archive to install the package from.
#' @return none
#' @importFrom devtools install_github
#' @export
Require <- function(..., github = NULL){
  if (!require(...)){
    if (!is.null(github)){
      Require("devtools")
      install_github(github)
    }
    install.packages(...)
    if (!require(...)) stop("Package not found.")
  }
}
