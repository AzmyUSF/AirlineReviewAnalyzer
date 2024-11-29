#' Extract Keywords
#'
#' This function extracts keywords from review text.
#'
#' @param data A data frame with a 'Review' column.
#' @return A data frame with keywords and their frequencies.
#' @importFrom tidytext unnest_tokens
#' @importFrom dplyr count
#' @importFrom magrittr %>%
#' @export
extract_keywords <- function(data) {
  data <- tidytext::unnest_tokens(data, word, Review) %>%
    dplyr::count(word, sort = TRUE)
  return(data)
}
