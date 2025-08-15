.PHONY: setup setup-dev data clean test lint format help

## Setup basic environment
setup:
	pip install -e .
	pip install -r requirements.txt

## Setup development environment
setup-dev: setup
	pip install -e ".[dev]"
	pre-commit install
	jupyter extension enable --py nbstripout

## Download and process data
data:
	python scripts/download_data.py
	python scripts/process_data.py

## Delete all compiled Python files and caches
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -name ".pytest_cache" -exec rm -rf {} +

## Run tests
test:
	python -m pytest tests/ -v --cov=src --cov-report=term-missing

## Run linting
lint:
	flake8 src tests scripts
	black --check src tests scripts

## Format code
format:
	black src tests scripts
	isort src tests scripts

## Show help
help:
	@echo "Available commands:"
	@echo "  setup      - Install basic dependencies"
	@echo "  setup-dev  - Install development dependencies"
	@echo "  data       - Download and process data"
	@echo "  clean      - Remove compiled files and caches"
	@echo "  test       - Run tests with coverage"
	@echo "  lint       - Run code linting"
	@echo "  format     - Format code with black and isort"
	@echo "  help       - Show this help message"

.DEFAULT_GOAL := help