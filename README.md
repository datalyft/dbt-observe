# dbt-observe

Observe and monitor dbt test outcomes with ease with datalyft's dbt-observe. 🔎

> 🚧 This package is under construction and is only compatible with AWS Redshift.

# Installation

Include this package in your dbt project by including it in the `packages.yml`

```yaml
packages:
  - git: https://github.com/datalyft/dbt-observe
    revision: 0.1.0
```

The package assumes all your tests are stored in the `dbt_tests` schema by default. You can overwrite this schema by adding the `observe.test_schema` var in your `dbt_project.yml` file.

```yaml
vars:
  observe:
    test_schema: "your_schema"
```

# Usage

`dbt-observe` will automatically add a new snapshot to your project, called `snp_dbt__tests`. You should run this snapshot daily to observe the outcomes of your tests.

```bash
dbt snapshot --select snp_dbt__tests
```

