#' Clean Feedback
#'
#' Cleans customer feedback by removing special characters and extra whitespace.
#' @param data A data frame with a 'Review' column containing text data.
#' @return A data frame with a cleaned 'Review' column.
#' @export
#' @examples
#' data <- data.frame(Review = c("  Excellent service!!! ", "Bad experience."))
#' clean_feedback(data)
clean_feedback <- function(data) {
  if (!"Review" %in% colnames(data)) {
    stop("The input data must contain a 'Review' column.")
  }
  data$Review <- stringr::str_trim(data$Review)
  data$Review <- stringr::str_remove_all(data$Review, "[^[:alnum:][:space:]']")
  return(data)
}
