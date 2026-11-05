# On-premises to cloud / cross-platform migration

This guide covers planning for moving Oracle workloads from on-premises data centers to OCI or AWS.

## Discovery
- Identify source hardware, OS, platform endian format, Oracle version and patch level.
- Capture RAC/ASM, storage, backup, network and security architecture.
- Identify external files, integrations, database links and application dependencies.
- Measure database size, growth, peak workload and batch windows.

## Cloud landing zone
- Select cloud service and region.
- Confirm Oracle version, edition, licensing and feature availability.
- Design VCN/VPC, subnets, routing, DNS, firewall/security lists and private connectivity.
- Plan encryption, key management, IAM, audit and privileged access.
- Size compute, memory, storage, IOPS/throughput and backup retention.

## Method selection
- Evaluate Data Pump for logical movement.
- Evaluate RMAN/physical methods where supported.
- Evaluate transportable tablespaces or cross-platform methods when prerequisites are met.
- Evaluate AWS DMS for supported replication scenarios and CDC.
- Evaluate GoldenGate where appropriate and licensed.

## Validation
- Compare object inventories and invalid objects.
- Reconcile row counts or use an approved data-validation approach.
- Validate constraints, indexes, sequences, jobs, grants and application integrations.
- Run representative performance and business tests.
- Confirm backup/restore and DR readiness on the target.

## Cutover
- Agree application write freeze and outage window.
- Complete final synchronization.
- Validate replication lag or recovery completion.
- Execute application connection change.
- Obtain DBA and application sign-off.
- Keep rollback criteria explicit and tested.

There is no single migration method that fits every on-premises-to-cloud scenario. Confirm support and restrictions for the exact source and target.
