#' Installs a required package if not available.
#'
#' @param pkg string or literal package name.
#' @param github string representation of github archive to install the package from if not found in local library. Will attempt to install from CRAN if left blank.
#' @return none
#' @importFrom devtools install_github
#' @importFrom utils install.packages
#' @export
Require <- function( pkg, github = NULL ){
  pkg_name <- as.character(substitute(pkg))

  loaded <- function( pkg_name) {
    tryCatch( require(pkg_name, quietly = TRUE, character.only = TRUE),
              warning = function(e) FALSE,
              error = function(e) FALSE) }

  if (!loaded(pkg_name) ){
    if (!is.null(github)){
      Require("devtools")
      install_github(github)
    }
    install.packages(pkg_name, repos = "http://cran.us.r-project.org" )
    if (!loaded(pkg_name)) stop("Package not found.")
  }
}
