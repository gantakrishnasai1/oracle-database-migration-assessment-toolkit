# Migration methodology

## 1. Discover

Collect source inventory, Oracle version, platform, database role, RAC/ASM details where applicable, character sets, time zone file version, options, schema/object counts, data footprint, growth, backup/recovery posture and application dependencies.

## 2. Assess the target

Confirm target service, region, shape, storage, licensing, supported Oracle versions, feature restrictions, networking, backup policy, encryption, monitoring, patching model and operational ownership.

## 3. Select a migration method

Choose only after validating the exact source/target combination, data volume, downtime objective, network path, platform endian compatibility, version compatibility and service limitations. See `../migration-methods/`.

## 4. Rehearse

Perform a representative test migration. Measure export/import or transfer duration, apply/replication lag, invalid objects, application testing duration and performance.

## 5. Cut over

Use an approved runbook with freeze window, final synchronization, application connection changes, validation gates, decision owner and explicit abort/rollback criteria.

## 6. Stabilize

Monitor database health, application response times, waits, storage, backup completion, replication/standby status and error logs. Retain source according to the approved rollback and retention plan.

## Platform coverage

The toolkit is intended for on-premises Oracle, OCI ExaCS, OCI Base Database Service and AWS RDS for Oracle. Not every method is available for every path. Validate provider documentation and support matrices for the exact versions and service types.
