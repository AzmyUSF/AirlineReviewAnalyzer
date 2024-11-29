#' Clean Feedback Text
#'
#' Cleans text data by removing extra spaces, special characters, and punctuation.
#' @param text A character vector of feedback strings.
#' @return A cleaned character vector.
#' @importFrom stringr str_remove_all str_trim
#' @importFrom magrittr %>%
#' @export
#' @examples
#' clean_feedback(c(" Excellent! ", " Terrible!"))
clean_feedback <- function(text) {
  text <- stringr::str_remove_all(text, "[^[:alnum:] ]") # Remove special characters
  text <- stringr::str_trim(text) # Trim spaces
  return(text)
}
