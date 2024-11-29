#' Analyze Sentiment
#'
#' Computes sentiment scores for a vector of text reviews.
#' @param text A character vector of reviews.
#' @return A data frame with sentiment scores.
#' @importFrom syuzhet get_sentiment
#' @importFrom magrittr %>%
#' @export
#' @examples
#' analyze_sentiment(c("Amazing flight!", "Terrible service."))
analyze_sentiment <- function(text) {
  scores <- syuzhet::get_sentiment(text)
  data.frame(Text = text, Sentiment = scores)
}
