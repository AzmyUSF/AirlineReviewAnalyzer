#' Load and Prepare Data
#'
#' This function loads review data from an Excel file and prepares it for analysis.
#'
#' @param file Path to the Excel file.
#' @return A data frame of prepared review data.
#' @importFrom readxl read_excel
#' @importFrom dplyr filter
#' @export
load_and_prepare_data <- function(file) {
  data <- readxl::read_excel(file)
  data <- dplyr::filter(data, !is.na(Review)) # Filter rows with missing reviews
  return(data)
}
