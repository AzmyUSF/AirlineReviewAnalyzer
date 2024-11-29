#' Visualize Trends
#'
#' Creates a line chart to show trends in average ratings over time by airline.
#' @param data A data frame with columns 'Review_Date', 'Overall_Rating', and 'Airline_Name'.
#' @return A ggplot2 plot showing trends by airline.
#' @export
#' @examples
#' data <- data.frame(Review_Date = as.Date(c("2023-01-01", "2023-02-01")),
#'                    Overall_Rating = c(5, 4),
#'                    Airline_Name = c("Airline A", "Airline B"))
#' visualize_trends(data)
visualize_trends <- function(data) {
  if (!all(c("Review_Date", "Overall_Rating", "Airline_Name") %in% colnames(data))) {
    stop("The input data must contain 'Review_Date', 'Overall_Rating', and 'Airline_Name' columns.")
  }
  ggplot2::ggplot(data, ggplot2::aes(x = Review_Date, y = Overall_Rating, color = Airline_Name)) +
    ggplot2::geom_line() +
    ggplot2::labs(title = "Trends in Airline Ratings Over Time",
                  x = "Review Date", y = "Overall Rating") +
    ggplot2::theme_minimal()
}
