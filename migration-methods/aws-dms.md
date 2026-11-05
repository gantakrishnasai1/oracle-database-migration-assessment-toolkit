# AWS Database Migration Service planning notes

For Oracle migrations involving AWS DMS, validate the exact Oracle source and target endpoint support in current AWS documentation.

Assessment points:
- Confirm source/target versions, deployment types and supported endpoint settings.
- Review supplemental logging requirements and privileges.
- Identify unsupported objects and plan separate handling for schema metadata, indexes, constraints, PL/SQL and jobs.
- Review datatype and LOB support, table mappings, partition handling and CDC limitations.
- Estimate full-load throughput and CDC apply rate.
- Monitor task state, table statistics, validation status and CDC latency.
- Rehearse cutover, application freeze and final lag convergence.

DMS is not a general replacement for schema migration tooling; determine which objects require separate migration steps.
