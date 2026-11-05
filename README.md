# Oracle Database Migration Assessment Toolkit

A generic, database-side assessment toolkit for planning Oracle Database migrations across on-premises, OCI and AWS environments.

## Supported migration scenarios

- On-premises Oracle to OCI Exadata Cloud Service (ExaCS)
- On-premises Oracle to OCI Base Database Service
- On-premises Oracle to AWS RDS for Oracle
- AWS RDS for Oracle to OCI ExaCS
- AWS RDS for Oracle to AWS RDS for Oracle
- OCI ExaCS to AWS RDS for Oracle or another OCI platform
- Other Oracle-to-Oracle paths, subject to source/target feature support

> **Important:** These scripts collect assessment information. They do not perform migrations, modify database configuration, create database links, or change application data. A reported result is not a certification that a migration path is supported. Validate each combination against current Oracle, OCI and AWS documentation and your organization's change process.

## Contents

| Path | Purpose |
|---|---|
| `sql/` | Read-only Oracle SQL inventory and readiness queries |
| `scripts/` | Optional shell wrapper and Python report formatter |
| `docs/` | Methodology, readiness checklist, strategy matrix and assessment template |
| `migration-methods/` | Planning notes for Data Pump, RMAN, AWS DMS and cross-platform migration |
| `sample-output/` | Synthetic example report; not derived from a customer system |

## Requirements

- Oracle Database account with permission to query the views used by the selected script.
- SQL*Plus or SQLcl for running SQL files.
- Python 3.9+ only if using the optional report formatter.
- Linux shell only if using the optional collection wrapper.

Run with an appropriately authorized read-only assessment account. Some views may require catalog privileges. If a query returns `ORA-00942` or `ORA-01031`, ask the DBA/security team for the minimum approved access; do not grant broad privileges just to make the toolkit run.

## Quick start

1. Review `docs/migration-readiness-checklist.md`.
2. Connect to the **source** database using SQL*Plus or SQLcl.
3. Run the SQL files individually and save output to a local, approved location.
4. Repeat applicable inventory checks on the **target** database.
5. Compare source and target results using `docs/assessment-template.md`.
6. Review migration-method notes and validate the selected path with the cloud provider's current support matrix.
7. Remove sensitive identifiers before sharing any assessment output.

Example:

```bash
sqlplus -L assessment_user@//dbhost:1521/service_name
SQL> SET PAGESIZE 100
SQL> SET LINESIZE 220
SQL> SET TRIMSPOOL ON
SQL> SPOOL source_inventory.txt
SQL> @sql/database_inventory.sql
SQL> SPOOL OFF
```

Run each script from the repository root. For SQL*Plus, use `@sql/<script>.sql`.

## Included SQL modules

- `database_inventory.sql`: database identity, version, role, platform and character sets.
- `database_configuration.sql`: log mode, force logging, flashback and selected settings.
- `schema_object_inventory.sql`: object counts by owner and type.
- `tablespace_assessment.sql`: tablespace capacity and free-space summary.
- `invalid_objects.sql`: invalid object inventory.
- `database_size_assessment.sql`: datafile, tempfile and segment footprint summaries.
- `compatibility_assessment.sql`: potentially relevant feature/parameter inventory for manual review.

Queries are intentionally conservative and read-only. Some columns or views vary by Oracle version, edition, privileges and managed-service restrictions. Validate scripts on a non-production/test system first.

## Safety and privacy

- Do not commit production query output, AWR reports, alert logs, trace files, database links, wallet files, credentials, private keys, customer names, hostnames, IP addresses, DBIDs, service names, or internal paths.
- `sample-output/` is synthetic and must remain clearly labelled as such.
- Check employer intellectual-property and open-source policies before publishing work-related code.
- Review `.gitignore` before adding generated files.

## Validation status

This initial toolkit is a starter release. SQL and shell scripts must be tested against the specific Oracle versions and target platforms in your environment before operational use. Do not describe a script as validated until it has been executed and reviewed.

## Disclaimer

Provided as a planning and assessment aid, without warranty. It is not a substitute for Oracle Support, AWS guidance, OCI documentation, security review, performance testing, or a formal migration runbook.
