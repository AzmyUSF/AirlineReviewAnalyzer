#' Load and Prepare Data
#'
#' This function loads the airline review dataset from a CSV file and prepares it for analysis.
#' It assumes the `Review.Date` column has been pre-cleaned and converts it into a standard `Date` format.
#' It also ensures `Overall_Rating` is numeric.
#'
#' @param file_path A string specifying the path to the CSV file.
#' @return A data frame with prepared data.
#' @export
#' @examples
#' file_path <- system.file("extdata", "Airline_review.csv", package = "AirlineReviewAnalyzer")
#' data <- load_and_prepare_data(file_path)
load_and_prepare_data <- function(file_path) {
  # Read the data from the CSV file
  data <- read.csv(file_path)
  print(head(data))  # Debug: Check initial read

  # Convert the Review.Date column to Date format
  data$Review.Date <- as.Date(data$Review.Date, format = "%Y-%m-%d")  # Adjust format if needed
  print(data$Review.Date)  # Debug: Check after conversion to Date

  # Convert Overall_Rating to numeric
  data$Overall_Rating <- as.numeric(data$Overall_Rating)
  print(summary(data$Overall_Rating))  # Debug: Check Overall_Rating summary

  # Return the prepared data
  return(data)
}
