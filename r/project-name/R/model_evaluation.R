#' Model Training and Evaluation Functions

#' Train multiple models
#'
#' @param train_data Training data
#' @param config Configuration list
#' @return List of trained models
#' @export
train_models <- function(train_data, config) {
  logger::log_info("Starting model training")
  
  target_col <- config$features$target_column
  feature_cols <- setdiff(names(train_data), target_col)
  
  # Prepare formula
  formula_str <- paste(target_col, "~", paste(feature_cols, collapse = " + "))
  model_formula <- as.formula(formula_str)
  
  models <- list()
  
  # Logistic Regression
  if ("logistic_regression" %in% names(config$models)) {
    logger::log_info("Training logistic regression")
    models$logistic_regression <- glm(
      model_formula, 
      data = train_data, 
      family = binomial()
    )
  }
  
  # Random Forest
  if ("random_forest" %in% names(config$models)) {
    logger::log_info("Training random forest")
    rf_params <- config$models$random_forest
    models$random_forest <- randomForest::randomForest(
      model_formula,
      data = train_data,
      ntree = rf_params$ntree,
      mtry = rf_params$mtry,
      importance = rf_params$importance
    )
  }
  
  # XGBoost (if available)
  if ("xgboost" %in% names(config$models) && requireNamespace("xgboost", quietly = TRUE)) {
    logger::log_info("Training XGBoost")
    
    # Prepare data for XGBoost
    X_train <- model.matrix(model_formula, data = train_data)[, -1]
    y_train <- train_data[[target_col]]
    
    xgb_params <- config$models$xgboost
    models$xgboost <- xgboost::xgboost(
      data = X_train,
      label = y_train,
      nrounds = xgb_params$nrounds,
      max_depth = xgb_params$max_depth,
      eta = xgb_params$eta,
      subsample = xgb_params$subsample,
      colsample_bytree = xgb_params$colsample_bytree,
      objective = "binary:logistic",
      verbose = 0
    )
  }
  
  logger::log_info("Model training completed")
  return(models)
}

#' Evaluate model performance
#'
#' @param models List of trained models
#' @param test_data Test data
#' @param config Configuration list
#' @return Data frame with model performance metrics
#' @export
evaluate_models <- function(models, test_data, config) {
  logger::log_info("Evaluating model performance")
  
  target_col <- config$features$target_column
  results <- data.frame()
  
  for (model_name in names(models)) {
    model <- models[[model_name]]
    
    # Make predictions
    if (model_name == "xgboost") {
      # Special handling for XGBoost
      feature_cols  0.5, 1, 0)
    } else {
      predictions  0.5, 1, 0)
    }
    
    # Calculate metrics
    actual <- test_data[[target_col]]
    
    accuracy <- mean(predicted_class == actual)
    
    # Confusion matrix
    cm <- table(Predicted = predicted_class, Actual = actual)
    
    if (nrow(cm) == 2 && ncol(cm) == 2) {
      precision <- cm[2, 2] / sum(cm[2, ])
      recall <- cm[2, 2] / sum(cm[, 2])
      f1_score <- 2 * (precision * recall) / (precision + recall)
      
      # AUC if applicable
      if (requireNamespace("pROC", quietly = TRUE)) {
        auc <- pROC::auc(pROC::roc(actual, predictions, quiet = TRUE))
      } else {
        auc <- NA
      }
    } else {
      precision <- recall <- f1_score <- auc <- NA
    }
    
    # Store results
    model_results <- data.frame(
      model = model_name,
      accuracy = accuracy,
      precision = precision,
      recall = recall,
      f1_score = f1_score,
      auc = auc
    )
    
    results <- rbind(results, model_results)
    
    logger::log_info("{model_name} - Accuracy: {round(accuracy, 3)}")
  }
  
  logger::log_info("Model evaluation completed")
  return(results)
}

#' Save trained models
#'
#' @param models List of trained models
#' @param output_dir Directory to save models
#' @export
save_models <- function(models, output_dir = "models/trained/") {
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }
  
  for (model_name in names(models)) {
    file_path <- file.path(output_dir, paste0(model_name, ".rds"))
    saveRDS(models[[model_name]], file_path)
    logger::log_info("Model saved: {file_path}")
  }
}