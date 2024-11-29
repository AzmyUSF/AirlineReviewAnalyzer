#' Summarize Ratings
#'
#' This function calculates the average overall rating for each airline.
#' @param data A data frame with columns 'Airline_Name' and 'Overall_Rating'.
#' @return A data frame with 'Airline_Name' and 'avg_rating'.
#' @export
#' @examples
#' data <- data.frame(Airline_Name = c("Airline A", "Airline B"),
#'                    Overall_Rating = c(5, 3))
#' summarize_ratings(data)
summarize_ratings <- function(data) {
  if (!all(c("Airline_Name", "Overall_Rating") %in% colnames(data))) {
    stop("The input data must contain 'Airline_Name' and 'Overall_Rating' columns.")
  }
  data %>%
    dplyr::group_by(Airline_Name) %>%
    dplyr::summarize(avg_rating = mean(Overall_Rating, na.rm = TRUE), .groups = "drop")
}
