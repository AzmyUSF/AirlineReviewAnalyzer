#' Visualize Review Trends
#'
#' This function visualizes trends in the number of reviews over time.
#'
#' @param data A data frame with 'Review_Date' column.
#' @return A ggplot object showing the review trends.
#' @importFrom ggplot2 ggplot aes geom_line labs theme_minimal
#' @importFrom dplyr mutate group_by summarize
#' @importFrom lubridate floor_date
#' @export
visualize_trends <- function(data) {
  data <- dplyr::mutate(data, YearMonth = lubridate::floor_date(Review_Date, "month")) %>%
    dplyr::group_by(YearMonth) %>%
    dplyr::summarize(Review_Count = dplyr::n())

  plot <- ggplot2::ggplot(data, ggplot2::aes(x = YearMonth, y = Review_Count)) +
    ggplot2::geom_line() +
    ggplot2::labs(title = "Review Trends Over Time", x = "Month", y = "Number of Reviews") +
    ggplot2::theme_minimal()

  return(plot)
}
