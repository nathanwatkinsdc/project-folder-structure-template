#' Utility Functions for Data Science Project
#'
#' A collection of helper functions for common data science tasks.

#' Load and validate configuration
#'
#' @param config_file Path to configuration file
#' @param env Environment (development, production, etc.)
#' @return Configuration list
#' @export
load_config  0) {
    logger::log_info("Installing missing packages: {paste(missing_packages, collapse = ', ')}")
    install.packages(missing_packages)
  }
  
  # Load packages
  invisible(sapply(packages, library, character.only = TRUE))
  logger::log_info("Packages loaded: {paste(packages, collapse = ', ')}")
}