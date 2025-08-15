.PHONY: setup setup-dev data clean test check document install help

R := Rscript --vanilla

## Setup basic environment
setup:
	$(R) -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv')"
	$(R) -e "renv::restore()"

## Setup development environment  
setup-dev: setup
	$(R) -e "renv::install(c('devtools', 'testthat', 'roxygen2', 'covr'))"

## Download and process data
data:
	$(R) scripts/download_data.R
	$(R) scripts/process_data.R

## Clean project
clean:
	$(R) -e "unlink(c('*.tar.gz', '*.Rcheck'), recursive = TRUE)"
	find . -name ".Rhistory" -delete
	find . -name ".RData" -delete

## Run tests
test:
	$(R) -e "devtools::test()"

## Check package
check:
	$(R) -e "devtools::check()"

## Generate documentation
document:
	$(R) -e "devtools::document()"

## Install package
install:
	$(R) -e "devtools::install()"

## Run full pipeline
pipeline:
	$(R) scripts/run_pipeline.R

## Generate coverage report
coverage:
	$(R) -e "covr::report()"

## Build package
build:
	$(R) -e "devtools::build()"

## Show help
help:
	@echo "Available commands:"
	@echo "  setup      - Install basic dependencies with renv"
	@echo "  setup-dev  - Install development dependencies"
	@echo "  data       - Download and process data"
	@echo "  clean      - Remove build artifacts"
	@echo "  test       - Run testthat tests"
	@echo "  check      - Run R CMD check"
	@echo "  document   - Generate roxygen2 documentation"
	@echo "  install    - Install package locally"
	@echo "  pipeline   - Run complete analysis pipeline"
	@echo "  coverage   - Generate test coverage report"
	@echo "  build      - Build package tarball"

.DEFAULT_GOAL := help