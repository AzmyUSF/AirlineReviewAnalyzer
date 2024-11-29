#' Summarize Top Airlines by Rating
#'
#' This function summarizes the top airlines based on average overall ratings.
#'
#' @param data A data frame with columns 'Airline_Name' and 'Overall_Rating'.
#' @return A tibble with the top 10 airlines by average rating.
#' @importFrom dplyr filter mutate group_by summarize arrange desc slice_max
#' @importFrom magrittr %>%
#' @export
summarize_top_airlines <- function(data) {
  if (!all(c("Airline_Name", "Overall_Rating") %in% colnames(data))) {
    stop("The input data must contain 'Airline_Name' and 'Overall_Rating' columns.")
  }

  data <- dplyr::filter(data, !is.na(Overall_Rating)) %>%
    dplyr::mutate(Overall_Rating = as.numeric(Overall_Rating)) %>%
    dplyr::group_by(Airline_Name) %>%
    dplyr::summarize(avg_rating = mean(Overall_Rating, na.rm = TRUE), review_count = dplyr::n()) %>%
    dplyr::arrange(dplyr::desc(avg_rating), dplyr::desc(review_count)) %>%
    dplyr::slice_max(order_by = avg_rating, n = 10)

  return(data)
}
