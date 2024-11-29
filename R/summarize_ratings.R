#' Summarize Ratings
#'
#' This function takes a dataset of airline ratings and calculates the average rating for each airline.
#' @param airline_data A data frame containing at least two columns:
#' \code{Airline Name} (character) and \code{Overall_Rating} (numeric).
#' @return A data frame with two columns: \code{Airline Name} and \code{avg_rating},
#' sorted in descending order of \code{avg_rating}.
#' @importFrom dplyr group_by summarize arrange desc
#' @importFrom magrittr %>%
#' @export
#' @examples
#' example_data <- data.frame(
#'   Airline_Name = c("Airline A", "Airline B", "Airline A"),
#'   Overall_Rating = c(5, 4, 3)
#' )
#' summarize_ratings(example_data)
summarize_ratings <- function(airline_data) {
  if (!"Airline_Name" %in% colnames(airline_data)) {
    stop("The input data must contain a column named 'Airline_Name'.")
  }

  if (!"Overall_Rating" %in% colnames(airline_data)) {
    stop("The input data must contain a column named 'Overall_Rating'.")
  }

  airline_data %>%
    dplyr::group_by(Airline_Name) %>%
    dplyr::summarize(avg_rating = mean(Overall_Rating, na.rm = TRUE)) %>%
    dplyr::arrange(dplyr::desc(avg_rating))
}

# Declare global variables to avoid R CMD check warnings
utils::globalVariables(c("Airline_Name", "Overall_Rating", "avg_rating"))
