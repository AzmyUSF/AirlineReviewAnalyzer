#' Load and Prepare Data
#'
#' Loads the airline review dataset from an Excel file and prepares it for analysis.
#'
#' @param file_path A string specifying the path to the Excel file.
#' @return A cleaned data frame ready for analysis.
#' @export
load_and_prepare_data <- function(file_path) {
  # Load the data using read_excel
  raw_data <- readxl::read_excel(file_path)

  # Check and convert the Review_Date column to Date format
  if ("Review_Date" %in% colnames(raw_data)) {
    raw_data$Review_Date <- as.Date(raw_data$Review_Date, format = "%Y-%m-%d")
  } else {
    stop("The column 'Review_Date' is missing from the dataset.")
  }

  # Check and convert Overall_Rating column to numeric
  if ("Overall_Rating" %in% colnames(raw_data)) {
    raw_data$Overall_Rating <- as.numeric(raw_data$Overall_Rating)
  } else {
    stop("The column 'Overall_Rating' is missing from the dataset.")
  }

  return(raw_data)
}


