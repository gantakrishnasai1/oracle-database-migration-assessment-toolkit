# Migration readiness checklist

Mark each item `Pass`, `Fail`, `N/A` or `Pending`, and record evidence in an approved internal location.

## Source discovery
- [ ] Oracle version, edition and platform identified
- [ ] Database role, CDB/PDB and RAC topology recorded
- [ ] Character sets and time zone file version recorded
- [ ] Database options and components reviewed
- [ ] Schema/object inventory completed
- [ ] Invalid objects reviewed
- [ ] Datafile, tempfile, segment and growth footprint assessed
- [ ] External dependencies identified (DB links, directories, jobs, external tables, files, wallets, integrations)
- [ ] Backup and recovery posture reviewed

## Target readiness
- [ ] Target service and region selected
- [ ] Source/target version compatibility confirmed
- [ ] Required options/features supported by target
- [ ] Compute, memory and storage sizing reviewed
- [ ] Network connectivity, bandwidth, latency and firewall paths tested
- [ ] Encryption/TDE and key-management approach approved
- [ ] Backup, retention, monitoring and patching model agreed
- [ ] Access controls and audit requirements reviewed

## Migration execution
- [ ] Migration method selected and support validated
- [ ] Test migration completed
- [ ] Downtime and throughput measured
- [ ] Data validation and reconciliation plan approved
- [ ] Application and integration test plan approved
- [ ] Cutover runbook reviewed
- [ ] Rollback/abort criteria and decision owner agreed

## Go-live
- [ ] Final synchronization completed
- [ ] Critical business transactions validated
- [ ] Application owners signed off
- [ ] Backup completed on target
- [ ] Monitoring and alerting active
- [ ] Hypercare ownership and duration agreed
