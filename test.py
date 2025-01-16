def test_dependency(module_name, import_name=None):
    try:
        module = __import__(import_name or module_name)
        version = getattr(module, '__version__', 'Unknown version')
        print(f"{module_name}: {version} - ✅")
    except ImportError as e:
        print(f"{module_name}: Failed to import - ❌\nError: {e}")

if __name__ == "__main__":
    dependencies = {
        "python": None,  # Check Python version separately
        "jupyter": "jupyter",
        "jupyterlab": "jupyterlab",
        "ipywidgets": "ipywidgets",
        "scikit-learn": "sklearn",
        "scipy": "scipy",
        "pandas": "pandas",
        "pandas-datareader": "pandas_datareader",
        "matplotlib": "matplotlib",
        "numpy": "numpy",
        "pillow": "PIL",
        "tqdm": "tqdm",
        "h5py": "h5py",
        "pyyaml": "yaml",
        "pandoc": "pandocfilters",  # Pandoc bindings are in pandocfilters
        "pytest": "pytest",
        "tensorflow-macos": "tensorflow",
        "tensorflow-datasets": "tensorflow_datasets",
        "gradescope-utils": "gradescope_utils",
        "imageio": "imageio",
        "gym": "gym"
    }

    print("Testing Dependencies:")
    # Test Python version
    import sys
    python_version = sys.version.split()[0]
    print(f"python: {python_version} - ✅")

    # Test each dependency
    for module_name, import_name in dependencies.items():
        if module_name != "python":
            test_dependency(module_name, import_name)