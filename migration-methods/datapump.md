# Oracle Data Pump planning notes

Use Data Pump for logical movement where the source/target versions, features and service restrictions permit.

Assessment points:
- Confirm `expdp`/`impdp` compatibility and supported parameters for the versions involved.
- Inventory schemas, tables, partitions, LOBs, grants, roles, synonyms, jobs and dependent objects.
- Review character sets, time zone file versions, datatypes and database options.
- Plan dump-file staging, encryption, transfer, checksums, storage capacity and cleanup.
- Confirm directory object and managed-service import/export procedures.
- Estimate export, transfer, import, index build and validation duration.
- Rehearse with representative data volume.

Do not put credentials or production dump files in this repository.
