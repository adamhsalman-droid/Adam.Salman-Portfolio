"""HSBI Databases portfolio package.

The course labs are stored in the Module01–Module05 directories.
This tiny package provides the entry point declared in pyproject.toml
so that `uv sync` can install the repository as a project.
"""

def main() -> None:
    """Show where to find the reproducible course exercises."""
    print("HSBI Databases Portfolio — open a ModuleXX/README.md for lab instructions.")


if __name__ == "__main__":
    main()
