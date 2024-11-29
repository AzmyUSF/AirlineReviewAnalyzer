#' Load and Prepare Airline Review Data
#'
#' This function loads the Airline Review dataset and prepares it for analysis.
#' It cleans the Review Date column and converts ratings to numeric format.
#'
#' @param file_path A string specifying the file path to the CSV dataset.
#' @return A cleaned data frame ready for analysis.
#' @examples
#' # Example usage:
#' file_path <- system.file("extdata", "Airline_review.csv", package = "AirlineReviewAnalyzer")
#' data <- load_and_prepare_data(file_path)
load_and_prepare_data <- function(file_path) {
  # Load the dataset
  data <- read.csv(file_path)

  # Remove ordinal indicators (st, nd, rd, th) from Review.Date
  data$Review.Date <- gsub("(st|nd|rd|th)", "", data$Review.Date)
  data$Review.Date <- trimws(data$Review.Date)

  # Convert Review.Date to Date format
  data$Review.Date <- as.Date(data$Review.Date, format = "%d %B %Y")

  # Convert Overall_Rating to numeric format
  data$Overall_Rating <- as.numeric(data$Overall_Rating)

  # Return the cleaned dataset
  return(data)
}
