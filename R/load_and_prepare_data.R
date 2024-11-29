#' Load and Prepare Airline Data
#'
#' This function loads the airline review data, removes ordinal indicators from review dates, trims white space, and formats columns as required.
#' @param file_path The path to the CSV file to be loaded.
#' @return A cleaned data frame.
#' @export
load_and_prepare_data <- function(file_path) {
  # Load data from CSV
  data <- read.csv(file_path, stringsAsFactors = FALSE)
  
  # Remove ordinal indicators and trim whitespace from the 'Review.Date' column
  data$Review.Date <- gsub("(st|nd|rd|th)", "", data$Review.Date, ignore.case = TRUE)
  data$Review.Date <- trimws(data$Review.Date)
  
  # Convert 'Review.Date' to Date format with additional checks
  data$Review.Date <- tryCatch({
    as.Date(data$Review.Date, format = "%d %B %Y")
  }, warning = function(w) {
    message("Warning during conversion: ", conditionMessage(w))
    as.Date(NA)
  }, error = function(e) {
    message("Error during conversion: ", conditionMessage(e))
    rep(NA, length(data$Review.Date))
  })
  
  # Ensure 'Overall_Rating' is numeric
  data$Overall_Rating <- suppressWarnings(as.numeric(data$Overall_Rating))

  # Return cleaned data
  return(data)
}

