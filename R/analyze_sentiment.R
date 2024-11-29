#' Analyze Sentiment
#'
#' This function analyzes sentiment for a given set of reviews.
#'
#' @param reviews A character vector of reviews.
#' @param method The sentiment analysis method (default: "syuzhet").
#' @return A data frame with sentiment scores.
#' @importFrom syuzhet get_sentiment
#' @export
analyze_sentiment <- function(reviews, method = "syuzhet") {
  sentiment_scores <- syuzhet::get_sentiment(reviews, method = method)
  data.frame(Review = reviews, Sentiment = sentiment_scores)
}
