# R Data Science Project Template

A comprehensive, production-ready template for data science projects in R.

## Project Overview

This template provides a structured approach to data science projects using R, incorporating best practices for reproducibility, collaboration, and maintainability.

## Features

- 📦 **Package Structure**: Organized as an R package for easy dependency management
- 🔄 **Reproducible Environment**: Uses `renv` for dependency management
- 📊 **R Markdown Integration**: Structured notebooks for analysis and reporting
- 🧪 **Testing Framework**: Built-in `testthat` testing structure
- 📝 **Documentation**: Roxygen2 documentation system
- ⚙️ **Configuration Management**: YAML-based configuration with environment support
- 🚀 **Automation**: Makefile for common tasks

## Getting Started

### Prerequisites

- R 4.1.0 or higher
- RStudio (recommended)
- Git

### Installation

1. **Clone and setup:**
   ```bash
   git clone 
   cd 
   make setup
   ```

2. **Open in RStudio:**
   - Open the `.Rproj` file in RStudio
   - The project will automatically activate `renv`

3. **Setup development environment:**
   ```bash
   make setup-dev
   ```

## Project Structure

### Project Structure - Condensed

```
├── R/                    # R source code
├── notebooks/            # R Markdown analysis notebooks  
├── data/                # Data directories
├── tests/               # Unit tests (testthat)
├── config/              # Configuration files
├── scripts/             # Standalone R scripts
├── man/                 # Generated documentation
└── reports/             # Generated reports and figures
```

### Project Structure - Full

```
project-name/
├── project-name.Rproj            # RStudio project file
├── README.md                     # Project overview and setup guide
├── DESCRIPTION                   # R package metadata
├── NAMESPACE                     # Package namespace (if building package)
├── renv.lock                     # renv lockfile for reproducibility
├── .Rprofile                     # R startup configuration
├── .gitignore                    # Version control exclusions
├── Makefile                      # Automation commands
├── 
├── config/
│   ├── config.yaml               # Main configuration
│   └── logging_config.yaml       # Logging setup
├── 
├── data/
│   ├── README.md                 # Data documentation
│   ├── raw/                      # Original, immutable data
│   ├── interim/                  # Intermediate processing steps
│   ├── processed/                # Final datasets for modeling
│   └── external/                 # Third-party data sources
├── 
├── notebooks/
│   ├── 01-data-exploration.Rmd   # Initial data investigation
│   ├── 02-data-cleaning.Rmd      # Data preparation
│   ├── 03-feature-engineering.Rmd # Feature creation and selection
│   ├── 04-modeling.Rmd           # Model development
│   ├── 05-evaluation.Rmd         # Model assessment
│   ├── 06-deployment-prep.Rmd    # Production preparation
│   └── templates/                # Reusable R Markdown templates
├── 
├── R/
│   ├── data_ingestion.R          # Data loading utilities
│   ├── data_cleaning.R           # Data cleaning functions
│   ├── data_validation.R         # Data quality checks
│   ├── feature_engineering.R     # Feature creation
│   ├── feature_selection.R       # Feature selection
│   ├── model_training.R          # Model training functions
│   ├── model_prediction.R        # Model inference
│   ├── model_evaluation.R        # Model evaluation
│   ├── visualization.R           # Plotting utilities
│   └── utils.R                   # General utilities
├── 
├── models/
│   ├── trained/                  # Serialized models (.rds files)
│   ├── experiments/              # Model experiments tracking
│   └── production/               # Production-ready models
├── 
├── reports/
│   ├── figures/                  # Generated plots and charts
│   ├── presentations/            # Slides and demos
│   ├── papers/                   # Technical documentation
│   └── automated/                # Automated reports
├── 
├── tests/
│   ├── testthat/                 # testthat test files
│   │   ├── test-data-processing.R
│   │   ├── test-feature-engineering.R
│   │   └── test-models.R
│   └── testthat.R                # Test runner
├── 
├── scripts/
│   ├── setup_environment.R       # Environment setup
│   ├── download_data.R           # Data acquisition
│   ├── run_pipeline.R            # End-to-end pipeline
│   └── deploy_model.R            # Model deployment
├── 
├── man/                          # Documentation (if building package)
├── vignettes/                    # Long-form documentation
└── docs/
    ├── data_dictionary.md        # Data definitions
    ├── methodology.md            # Approach documentation
    └── deployment_guide.md       # Production deployment
```

## Usage

### Interactive Development

```r
# Load the project environment
source_all()  # Sources all R functions

# Load configuration
config <- load_project_config()

# Run data processing
data <- load_raw_data("data/raw/sample.csv", config)
clean_data <- clean_data(data, config)
```

### Running the Pipeline

```bash
# Run complete analysis pipeline
make pipeline

# Or run individual steps
make data      # Download and process data
make test      # Run tests
make document  # Generate documentation
make check     # Run R CMD check
```

### R Markdown Notebooks

The `notebooks/` directory contains structured R Markdown files for different analysis phases:

1. **01-data-exploration.Rmd** - Initial data investigation
2. **02-data-cleaning.Rmd** - Data preparation and cleaning
3. **03-feature-engineering.Rmd** - Feature creation and selection
4. **04-modeling.Rmd** - Model development and training
5. **05-evaluation.Rmd** - Model evaluation and comparison
6. **06-deployment-prep.Rmd** - Preparation for production deployment

Each notebook follows a consistent structure and can be run independently or as part of a larger pipeline.

### Testing

```r
# Run all tests
devtools::test()

# Run specific test file
testthat::test_file("tests/testthat/test-data-processing.R")

# Check test coverage
covr::report()
```

### Configuration Management

The project uses YAML configuration files that support multiple environments:

```r
# Load default configuration
config <- config::get(file = "config/config.yaml")

# Load development-specific configuration
config <- config::get(file = "config/config.yaml", config = "development")

# Load production configuration
config <- config::get(file = "config/config.yaml", config = "production")
```

## Package Development

This template is structured as an R package, providing several advantages:

- **Dependency Management**: Clearly defined dependencies in DESCRIPTION
- **Documentation**: Automatic documentation generation with roxygen2
- **Testing**: Integrated testing framework with testthat
- **Distribution**: Easy sharing and installation
- **Namespace Management**: Proper function namespacing

### Key Commands

```r
# Generate documentation
devtools::document()

# Install package locally
devtools::install()

# Check package
devtools::check()

# Build package
devtools::build()
```

## Data Management

### Data Directory Structure

- `data/raw/` - Original, immutable data files
- `data/interim/` - Intermediate data processing steps
- `data/processed/` - Final datasets ready for modeling
- `data/external/` - Third-party data sources

### Data Loading Example

```r
# Load and process data
config <- load_project_config()
raw_data <- load_raw_data("data/raw/dataset.csv", config)
clean_data <- clean_data(raw_data, config)
split_data <- split_data(clean_data, config)
```

## Modeling Workflow

### Training Models

```r
# Train multiple models
models <- train_models(split_data$train, config)

# Evaluate performance
results <- evaluate_models(models, split_data$test, config)

# Save models
save_models(models, "models/trained/")
```

### Model Comparison

```r
# View performance metrics
print(results)

# Visualize results
library(ggplot2)
results %>%
  tidyr::pivot_longer(cols = c(accuracy, precision, recall, f1_score), 
                      names_to = "metric", values_to = "value") %>%
  ggplot(aes(x = model, y = value, fill = metric)) +
  geom_col(position = "dodge") +
  theme_minimal() +
  labs(title = "Model Performance Comparison")
```

## Reproducibility

### Environment Management with renv

```r
# Snapshot current state
renv::snapshot()

# Restore from lockfile
renv::restore()

# Update packages
renv::update()

# Check package status
renv::status()
```

### Reproducible Reports

Use the provided R Markdown templates to create reproducible reports:

```r
# Render a specific notebook
rmarkdown::render("notebooks/01-data-exploration.Rmd")

# Render all notebooks
notebooks <- list.files("notebooks", pattern = "*.Rmd", full.names = TRUE)
purrr::walk(notebooks, rmarkdown::render)
```

## Advanced Features

### Parallel Processing

The template supports parallel processing for computationally intensive tasks:

```r
# Configure parallel processing
library(parallel)
library(doParallel)

# Setup cluster
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)

# Use in modeling
models <- train_models_parallel(train_data, config)

# Cleanup
stopCluster(cl)
```

### Logging and Monitoring

```r
# Setup logging
setup_logging(config)

# Use throughout your code
logger::log_info("Starting data processing")
logger::log_warn("Missing values detected")
logger::log_error("Model training failed")
```

### Database Integration

```r
# Connect to database (if configured)
library(DBI)
library(RPostgres)

con <- dbConnect(
  RPostgres::Postgres(),
  host = config$database$host,
  port = config$database$port,
  dbname = config$database$name,
  user = Sys.getenv("DB_USER"),
  password = Sys.getenv("DB_PASSWORD")
)

# Query data
data <- dbGetQuery(con, "SELECT * FROM my_table")

# Cleanup
dbDisconnect(con)
```

## Deployment

### Model Serialization

```r
# Save model with metadata
model_info <- list(
  model = trained_model,
  config = config,
  training_date = Sys.Date(),
  performance = model_metrics
)

saveRDS(model_info, "models/production/final_model.rds")
```

### Plumber API

Create REST APIs for model serving:

```r
# plumber.R
library(plumber)

#* @apiTitle Model Prediction API
#* @apiDescription API for making predictions with trained models

#* Predict using trained model
#* @param feature1 Numeric feature 1
#* @param feature2 Character feature 2
#* @post /predict
function(feature1, feature2) {
  # Load model
  model <- readRDS("models/production/final_model.rds")
  
  # Create prediction data
  new_data <- data.frame(
    feature1 = as.numeric(feature1),
    feature2 = as.character(feature2)
  )
  
  # Make prediction
  prediction <- predict(model$model, new_data)
  
  return(list(prediction = prediction))
}
```

### Docker Integration

```dockerfile
# Dockerfile
FROM rocker/r-ver:4.3.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

# Set working directory
WORKDIR /app

# Copy renv files
COPY renv.lock renv/activate.R ./
COPY .Rprofile ./

# Install renv and restore packages
RUN R -e "install.packages('renv')"
RUN R -e "renv::restore()"

# Copy project files
COPY . .

# Install project package
RUN R -e "devtools::install()"

# Expose port for Plumber API
EXPOSE 8000

# Run the API
CMD ["R", "-e", "plumber::plumb('plumber.R')$run(host='0.0.0.0', port=8000)"]
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes following the coding standards
4. Add tests for new functionality
5. Run `make check` to ensure everything passes
6. Commit your changes (`git commit -m 'Add amazing feature'`)
7. Push to the branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

### Coding Standards

- Follow [tidyverse style guide](https://style.tidyverse.org/)
- Document all functions with roxygen2
- Write tests for new functions
- Use descriptive variable names
- Keep functions focused and modular

## Troubleshooting

### Common Issues

1. **renv not activating**: Restart R session and run `renv::activate()`
2. **Package installation fails**: Check system dependencies
3. **Tests failing**: Ensure all dependencies are installed with `make setup-dev`
4. **Documentation not generating**: Run `devtools::document()` manually

### Getting Help

- Check the [project issues](https://github.com/your-repo/issues)
- Review the function documentation: `?function_name`
- Run `renv::diagnostics()` for environment issues

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspired by [Cookiecutter Data Science](https://cookiecutter-data-science.drivendata.org/)
- Built on the shoulders of the amazing R community
- Thanks to all package maintainers in the R ecosystem
```
