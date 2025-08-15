#' Clean and preprocess data
#'
#' @param data Raw data frame
#' @param config Configuration list
#' @return Cleaned data frame
#' @export
clean_data  0) {
    logger::log_info("Removed {removed_rows} duplicate rows")
  }
  
  # Handle missing values in numerical columns
  num_cols  0) {
    data %
      dplyr::mutate(
        dplyr::across(
          dplyr::all_of(num_cols),
          ~ ifelse(is.na(.), median(., na.rm = TRUE), .)
        )
      )
    logger::log_info("Imputed missing values in numerical columns")
  }
  
  # Handle missing values in categorical columns
  cat_cols  0) {
    data %
      dplyr::mutate(
        dplyr::across(
          dplyr::all_of(cat_cols),
          ~ ifelse(is.na(.), "Unknown", .)
        )
      )
    logger::log_info("Imputed missing values in categorical columns")
  }
  
  logger::log_info("Data cleaning completed")
  return(data)
}

#' Split data into train/test sets
#'
#' @param data Cleaned data frame
#' @param config Configuration list
#' @return List containing train and test sets
#' @export
split_data <- function(data, config) {
  set_seed(config$modeling$seed)
  
  target_col <- config$features$target_column
  test_size <- config$modeling$test_split
  
  # Create stratified split for classification
  if (is.factor(data[[target_col]]) || is.character(data[[target_col]])) {
    train_indices <- caret::createDataPartition(
      data[[target_col]], 
      p = 1 - test_size, 
      list = FALSE
    )
  } else {
    # Simple random split for regression
    train_indices <- sample(nrow(data), size = floor((1 - test_size) * nrow(data)))
  }
  
  train_data <- data[train_indices, ]
  test_data <- data[-train_indices, ]
  
  logger::log_info("Data split - Train: {nrow(train_data)}, Test: {nrow(test_data)}")
  
  return(list(
    train = train_data,
    test = test_data
  ))
}