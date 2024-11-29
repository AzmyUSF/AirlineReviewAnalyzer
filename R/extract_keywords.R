#' Extract Keywords from Feedback
#'
#' This function extracts keywords from text data using tokenization and stop word removal.
#' @param text_data A data frame containing text data.
#' @return A data frame of keywords with their frequencies.
#' @importFrom magrittr %>%
#' @importFrom tidytext unnest_tokens
#' @importFrom dplyr count filter
#' @export
#' @examples
#' text_data <- data.frame(text = c("Excellent service!", "Terrible flight."))
#' extract_keywords(text_data)
extract_keywords <- function(text_data) {
  stop_words <- tidytext::stop_words
  text_data %>%
    tidytext::unnest_tokens(word, text) %>%
    dplyr::filter(!word %in% stop_words$word) %>%
    dplyr::count(word, sort = TRUE)
}
