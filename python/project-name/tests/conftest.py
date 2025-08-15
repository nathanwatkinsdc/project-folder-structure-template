"""Pytest configuration and fixtures."""

import pytest
import pandas as pd
import numpy as np
from pathlib import Path
import tempfile
import shutil


@pytest.fixture
def sample_data():
    """Create sample data for testing."""
    np.random.seed(42)
    n_samples = 1000
    
    data = {
        'feature_1': np.random.normal(0, 1, n_samples),
        'feature_2': np.random.uniform(0, 10, n_samples),
        'feature_3': np.random.choice(['A', 'B', 'C'], n_samples),
        'target': np.random.choice([0, 1], n_samples)
    }
    
    return pd.DataFrame(data)


@pytest.fixture
def temp_dir():
    """Create a temporary directory for testing."""
    temp_path = Path(tempfile.mkdtemp())
    yield temp_path
    shutil.rmtree(temp_path)


@pytest.fixture
def config():
    """Sample configuration for testing."""
    return {
        'project': {
            'name': 'test-project',
            'version': '1.0.0'
        },
        'data': {
            'raw_path': 'data/raw/',
            'processed_path': 'data/processed/'
        },
        'modeling': {
            'random_state': 42,
            'test_size': 0.2
        }
    }