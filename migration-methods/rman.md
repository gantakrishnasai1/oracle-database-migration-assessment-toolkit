# RMAN migration planning notes

RMAN-based physical migration may be suitable for certain Oracle-to-Oracle paths. Availability depends on source/target platform, version, architecture and cloud-service restrictions.

Assessment points:
- Confirm supported source/target combinations and documented procedure.
- Check platform endian format and whether conversion is required.
- Review database version, patch level, database options and storage architecture.
- Confirm backup access, transfer path, encryption and throughput.
- Plan control file, SPFILE, password file and TDE wallet/key handling according to the target service procedure.
- Validate recovery, incarnation, redo and standby implications.
- Rehearse restore/recovery and measure outage.

Never copy wallet material, backups or production configuration into a public repository.
