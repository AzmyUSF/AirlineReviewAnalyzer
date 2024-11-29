#' Analyze Sentiment
#'
#' Performs sentiment analysis on the review text.
#' @param data A data frame with a 'Review' column containing text data.
#' @return A data frame with an additional 'Sentiment_Score' column.
#' @export
#' @examples
#' data <- data.frame(Review = c("Great service!", "Terrible experience."))
#' analyze_sentiment(data)
analyze_sentiment <- function(data) {
  if (!"Review" %in% colnames(data)) {
    stop("The input data must contain a 'Review' column.")
  }
  data$Sentiment_Score <- textdata::get_sentiment(data$Review, method = "bing")
  return(data)
}
