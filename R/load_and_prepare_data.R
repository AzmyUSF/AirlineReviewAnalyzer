#' Load and Prepare Airline Review Data
#'
#' This function loads the airline review data from a specified CSV file
#' and cleans it for analysis.
#' @param file_path A string specifying the path to the CSV file.
#' @return A cleaned data frame ready for analysis.
#' @export
load_and_prepare_data <- function(file_path) {
  data <- read.csv(file_path)
  data$Review.Date <- gsub("(st|nd|rd|th)", "", data$Review.Date)
  data$Review.Date <- trimws(data$Review.Date)
  data$Review.Date <- as.Date(data$Review.Date, format = "%d %B %Y")
  data$Overall_Rating <- as.numeric(data$Overall_Rating)
  return(data)
}

