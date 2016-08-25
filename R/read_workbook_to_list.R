#' Reads an xlsx file into a list of data.frames, one for each sheet.
#'
#' @param file path to xlsx workbook
#' @import openxlsx
#' @export
#' @return list of data.frame
read.all.xlsx <- function( file = NULL ){
  if (is.null(file)) stop( "file is required" )

  # get the sheets from the file
  sheets <- getSheetNames( file )
  names(sheets) <- sheets

  # get the data
  lapply( sheets, function( sheet ) read.xlsx( file, sheet ) )
}
