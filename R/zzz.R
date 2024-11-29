# utils-global.R
# Suppress R CMD check warnings for global variables
utils::globalVariables(c(
  "word", "Review", "YearMonth", "Review_Date",
  "Overall_Rating", "Airline_Name", "avg_rating", "review_count", "Review_Count"
))
