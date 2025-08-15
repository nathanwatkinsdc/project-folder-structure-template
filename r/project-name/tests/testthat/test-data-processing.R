# Test data processing functions
library(testthat)
library(dplyr)

test_that("load_raw_data works correctly", {
  # Create test data
  test_data <- data.frame(
    feature1 = 1:10,
    feature2 = letters[1:10],
    target = sample(0:1, 10, replace = TRUE)
  )
  
  # Save to temporary file
  temp_file <- tempfile(fileext = ".csv")
  readr::write_csv(test_data, temp_file)
  
  # Test loading
  config <- list()
  loaded_data <- load_raw_data(temp_file, config)
  
  expect_s3_class(loaded_data, "tbl_df")
  expect_equal(nrow(loaded_data), 10)
  expect_equal(ncol(loaded_data), 3)
  
  # Clean up
  unlink(temp_file)
})

test_that("validate_data catches missing columns", {
  test_data <- data.frame(
    feature1 = 1:10,
    feature2 = letters[1:10]
    # missing target column
  )
  
  config <- list(
    features = list(
      target_column = "target",
      categorical_features = c("feature2"),
      numerical_features = c("feature1")
    )
  )
  
  expect_false(validate_data(test_data, config))
})

test_that("clean_data removes duplicates", {
  test_data <- data.frame(
    feature1 = c(1, 2, 2, 3),
    feature2 = c("a", "b", "b", "c"),
    target = c(0, 1, 1, 0)
  )
  
  config <- list(
    features = list(
      numerical_features = c("feature1"),
      categorical_features = c("feature2")
    )
  )
  
  cleaned_data <- clean_data(test_data, config)
  expect_equal(nrow(cleaned_data), 3)
})

test_that("split_data creates proper train/test split", {
  test_data <- data.frame(
    feature1 = 1:100,
    feature2 = sample(letters[1:5], 100, replace = TRUE),
    target = sample(0:1, 100, replace = TRUE)
  )
  
  config <- list(
    modeling = list(
      seed = 42,
      test_split = 0.2
    ),
    features = list(
      target_column = "target"
    )
  )
  
  split_result <- split_data(test_data, config)
  
  expect_type(split_result, "list")
  expect_true("train" %in% names(split_result))
  expect_true("test" %in% names(split_result))
  expect_equal(nrow(split_result$train) + nrow(split_result$test), 100)
  expect_true(nrow(split_result$test) / 100 >= 0.15 && nrow(split_result$test) / 100 <= 0.25)
})# Test data processing functions
library(testthat)
library(dplyr)

test_that("load_raw_data works correctly", {
  # Create test data
  test_data <- data.frame(
    feature1 = 1:10,
    feature2 = letters[1:10],
    target = sample(0:1, 10, replace = TRUE)
  )
  
  # Save to temporary file
  temp_file <- tempfile(fileext = ".csv")
  readr::write_csv(test_data, temp_file)
  
  # Test loading
  config <- list()
  loaded_data <- load_raw_data(temp_file, config)
  
  expect_s3_class(loaded_data, "tbl_df")
  expect_equal(nrow(loaded_data), 10)
  expect_equal(ncol(loaded_data), 3)
  
  # Clean up
  unlink(temp_file)
})

test_that("validate_data catches missing columns", {
  test_data <- data.frame(
    feature1 = 1:10,
    feature2 = letters[1:10]
    # missing target column
  )
  
  config <- list(
    features = list(
      target_column = "target",
      categorical_features = c("feature2"),
      numerical_features = c("feature1")
    )
  )
  
  expect_false(validate_data(test_data, config))
})

test_that("clean_data removes duplicates", {
  test_data <- data.frame(
    feature1 = c(1, 2, 2, 3),
    feature2 = c("a", "b", "b", "c"),
    target = c(0, 1, 1, 0)
  )
  
  config <- list(
    features = list(
      numerical_features = c("feature1"),
      categorical_features = c("feature2")
    )
  )
  
  cleaned_data <- clean_data(test_data, config)
  expect_equal(nrow(cleaned_data), 3)
})

test_that("split_data creates proper train/test split", {
  test_data <- data.frame(
    feature1 = 1:100,
    feature2 = sample(letters[1:5], 100, replace = TRUE),
    target = sample(0:1, 100, replace = TRUE)
  )
  
  config <- list(
    modeling = list(
      seed = 42,
      test_split = 0.2
    ),
    features = list(
      target_column = "target"
    )
  )
  
  split_result <- split_data(test_data, config)
  
  expect_type(split_result, "list")
  expect_true("train" %in% names(split_result))
  expect_true("test" %in% names(split_result))
  expect_equal(nrow(split_result$train) + nrow(split_result$test), 100)
  expect_true(nrow(split_result$test) / 100 >= 0.15 && nrow(split_result$test) / 100 <= 0.25)
})# Test data processing functions
library(testthat)
library(dplyr)

test_that("load_raw_data works correctly", {
  # Create test data
  test_data <- data.frame(
    feature1 = 1:10,
    feature2 = letters[1:10],
    target = sample(0:1, 10, replace = TRUE)
  )
  
  # Save to temporary file
  temp_file <- tempfile(fileext = ".csv")
  readr::write_csv(test_data, temp_file)
  
  # Test loading
  config <- list()
  loaded_data <- load_raw_data(temp_file, config)
  
  expect_s3_class(loaded_data, "tbl_df")
  expect_equal(nrow(loaded_data), 10)
  expect_equal(ncol(loaded_data), 3)
  
  # Clean up
  unlink(temp_file)
})

test_that("validate_data catches missing columns", {
  test_data <- data.frame(
    feature1 = 1:10,
    feature2 = letters[1:10]
    # missing target column
  )
  
  config <- list(
    features = list(
      target_column = "target",
      categorical_features = c("feature2"),
      numerical_features = c("feature1")
    )
  )
  
  expect_false(validate_data(test_data, config))
})

test_that("clean_data removes duplicates", {
  test_data <- data.frame(
    feature1 = c(1, 2, 2, 3),
    feature2 = c("a", "b", "b", "c"),
    target = c(0, 1, 1, 0)
  )
  
  config <- list(
    features = list(
      numerical_features = c("feature1"),
      categorical_features = c("feature2")
    )
  )
  
  cleaned_data <- clean_data(test_data, config)
  expect_equal(nrow(cleaned_data), 3)
})

test_that("split_data creates proper train/test split", {
  test_data <- data.frame(
    feature1 = 1:100,
    feature2 = sample(letters[1:5], 100, replace = TRUE),
    target = sample(0:1, 100, replace = TRUE)
  )
  
  config <- list(
    modeling = list(
      seed = 42,
      test_split = 0.2
    ),
    features = list(
      target_column = "target"
    )
  )
  
  split_result <- split_data(test_data, config)
  
  expect_type(split_result, "list")
  expect_true("train" %in% names(split_result))
  expect_true("test" %in% names(split_result))
  expect_equal(nrow(split_result$train) + nrow(split_result$test), 100)
  expect_true(nrow(split_result$test) / 100 >= 0.15 && nrow(split_result$test) / 100 <= 0.25)
})