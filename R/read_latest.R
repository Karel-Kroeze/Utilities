#' Reads the latest file in a folder.
#'
#' @param filetype csv, csv2, json or excel. Defaults to json.
#' @param folder path to folder
#' @param pattern pattern to match files on. Note that by default files are filtered by file extensions correct for the type.
#' @param ... further arguments passed to jsonlite::fromJSON, read.csv, openxlsx::read.xlsx, etc.
#' @export
#' @import magrittr
#' @importFrom jsonlite fromJSON
#' @importFrom openxlsx read.xlsx
#' @importFrom utils read.csv read.csv2
read.latest <- function( folder = NULL, filetype = "json", pattern = NULL, ... ){
  if (!(filetype %in% c("json", "csv", "csv2", "excel" ) ) )
    stop( "invalid filetype")
  if (is.null(folder))
    stop( "no path to folder provided" )
  if (is.null(pattern)){
    if( filetype == "json" )
      pattern = ".json"
    if( filetype == "csv" | filetype == "csv2" )
      pattern = ".csv"
    if ( filetype == "excel" )
      pattern = ".xls"
  }

  # start your job!
  files <- list.files( folder, pattern )
  info <- files %>% file.info
  if( (files %>% length ) <= 0 )
    stop( "no files matching '", pattern, "' at path '", folder, "'" )

  # get latest
  latest <- files[which.max(info$mtime)]
  cat( latest )

  # read
  invisible( switch( filetype,
          "json" = fromJSON( latest, ... ),
          "csv" = read.csv( latest, ... ),
          "csv2" = read.csv2( latest, ... ),
          "excel" = read.xlsx( latest, ... ) ) )

}

