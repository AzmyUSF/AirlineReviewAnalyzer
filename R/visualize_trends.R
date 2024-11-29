#' Visualize Trends
#'
#' This function visualizes trends in airline feedback over time by airline.
#' @param data A data frame containing columns `Review_Date` (date),
#'        `Overall_Rating` (numeric), and `Airline_Name` (character).
#' @return A ggplot object showing trends in ratings over time by airline.
#' @export
visualize_trends <- function(data) {
  # Ensure Review_Date is in Date format
  if (!inherits(data$Review_Date, "Date")) {
    stop("Review_Date must be a Date object.")
  }

  library(dplyr)
  library(ggplot2)

  # Aggregate data by airline and year-month
  grouped_data <- data %>%
    mutate(YearMonth = format(Review_Date, "%Y-%m")) %>%
    group_by(Airline_Name, YearMonth) %>%
    summarize(
      avg_rating = mean(Overall_Rating, na.rm = TRUE),
      .groups = "drop"
    )

  # Plot trends
  ggplot(grouped_data, aes(x = as.Date(paste0(YearMonth, "-01")), y = avg_rating, color = Airline_Name)) +
    geom_line() +
    labs(
      title = "Trends in Airline Ratings Over Time",
      x = "Date",
      y = "Average Overall Rating"
    ) +
    theme_minimal() +
    theme(legend.position = "bottom")
}
