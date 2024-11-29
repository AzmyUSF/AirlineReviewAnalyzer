#' Extract Keywords
#'
#' Extracts keywords from the review text using term frequency.
#' @param data A data frame with a 'Review' column.
#' @return A data frame with keywords and their frequencies.
#' @export
#' @examples
#' data <- data.frame(Review = c("Great flight experience!", "Very bad food."))
#' extract_keywords(data)
extract_keywords <- function(data) {
  if (!"Review" %in% colnames(data)) {
    stop("The input data must contain a 'Review' column.")
  }
  tokens <- data %>%
    tidytext::unnest_tokens(word, Review) %>%
    dplyr::count(word, sort = TRUE)
  return(tokens)
}
