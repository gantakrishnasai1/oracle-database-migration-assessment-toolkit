# Migration strategy matrix

This matrix is a planning aid, not a support guarantee.

| Method | Typical use | Key considerations |
|---|---|---|
| Oracle Data Pump | Logical migration, schema/table movement, supported version/platform combinations | Export/import duration, object compatibility, LOBs, grants, directory access, downtime, network or object storage transfer |
| RMAN backup/restore or duplicate | Physical migration where source/target and service support permit | Version/platform compatibility, endian conversion, backup access, network throughput, target service restrictions |
| AWS DMS | Supported Oracle source/target combinations, initial load and/or CDC | DMS limitations, supplemental logging, supported datatypes/objects, CDC lag, LOB settings, validation and cutover |
| Transportable tablespaces / cross-platform transport | Large data movement where prerequisites are met | Endian conversion, self-contained checks, tablespace read-only window, metadata movement, version constraints |
| GoldenGate | Low-downtime replication where licensed and supported | Licensing, topology, datatype support, supplemental logging, conflict handling, lag and operational complexity |

## Decision inputs

- Source and target platform/service
- Oracle versions and patch levels
- Database size and growth
- Downtime objective
- Network bandwidth and latency
- Application write rate
- Required objects and datatype support
- Licensing and service restrictions
- Operational skills and rollback strategy

Always verify current Oracle and cloud-provider documentation before selecting a method.
