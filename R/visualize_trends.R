#' Visualize Trends
#'
#' This function visualizes trends in airline feedback over time for all airlines.
#' @param data A data frame containing at least three columns:
#' `Review_Date` (date), `Overall_Rating` (numeric), and `Airline_Name` (character).
#' @return A ggplot2 object showing trends over time, with facets for each airline.
#' @export
#' @examples
#' example_data <- data.frame(
#'   Review_Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03")),
#'   Overall_Rating = c(5, 4, 3),
#'   Airline_Name = c("Airline A", "Airline B", "Airline A")
#' )
#' visualize_trends(example_data)
visualize_trends <- function(data) {
  ggplot2::ggplot(data = data, ggplot2::aes(x = Review.Date, y = Overall_Rating, color = Airline_Name)) +
    ggplot2::geom_line() +
    ggplot2::facet_wrap(~ Airline_Name, scales = "free_y") +
    ggplot2::labs(
      title = "Trends in Overall Ratings by Airline",
      x = "Review Date",
      y = "Overall Rating"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(legend.position = "none")
}
