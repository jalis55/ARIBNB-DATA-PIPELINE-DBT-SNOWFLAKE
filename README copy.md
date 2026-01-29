# Airbnb Data Project

This project implements a data transformation pipeline for Airbnb data using **dbt (data build tool)** and **Snowflake**. It follows a **medallion architecture** (Bronze, Silver, Gold) to process and refine data for analysis.

## Project Structure

The project is organized as follows:

```
airbnb-project/
├── dbt_snowflae_project/   # Main dbt project directory
│   ├── models/             # dbt models (SQL files)
│   │   ├── bronze/         # Raw data ingestion
│   │   ├── silver/         # Cleaned and transformed data
│   │   └── gold/           # Business-level aggregates
│   ├── seeds/              # CSV data seeds
│   ├── tests/              # Data quality tests
│   └── dbt_project.yml     # dbt project configuration
├── .python-version         # Python version specifier
├── pyproject.toml          # Project configuration and dependencies
└── requirements.txt        # Python dependencies
```

## Prerequisites

-   **Python 3.12+**
-   **Snowflake Account**: You need a Snowflake account with appropriate permissions to create databases, schemas, and tables.
-   **uv** (Recommended) or `pip` for dependency management.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd airbnb-project
    ```

2.  **Install dependencies:**

    Using `uv`:
    ```bash
    uv sync
    ```

    Or using `pip`:
    ```bash
    pip install -r requirements.txt
    ```

3.  **Configure dbt:**
    -   Ensure you have a `profiles.yml` file configured with your Snowflake credentials.
    -   By default, dbt looks for `profiles.yml` in `~/.dbt/`. You can also place it in the project root (ensure it is git-ignored).

    Example `profiles.yml`:
    ```yaml
    dbt_snowflae_project:
      target: dev
      outputs:
        dev:
          type: snowflake
          account: <your_account>
          user: <your_username>
          password: <your_password>
          role: <your_role>
          database: <your_database>
          warehouse: <your_warehouse>
          schema: <your_schema>
          threads: 1
    ```

## Usage

Navigate to the dbt project directory:

```bash
cd dbt_snowflae_project
```

### Running Models

Run all models:
```bash
dbt run
```

Run specific models (e.g., only gold layer):
```bash
dbt run --select gold
```

### Testing

Run data quality tests:
```bash
dbt test
```

### Documentation

Generate and view project documentation:
```bash
dbt docs generate
dbt docs serve
```

## Architecture Layers

1.  **Bronze**: Raw data ingested from source (e.g. seeds).
2.  **Silver**: Cleaned data with standardized types and basic transformations.
3.  **Gold**: Aggregated and business-ready data models (Facts and Dimensions).
