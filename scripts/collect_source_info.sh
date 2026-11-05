#!/usr/bin/env bash
# Optional SQL*Plus wrapper. Run from repository root.
# Usage: ./scripts/collect_source_info.sh user@//host:1521/service
# Prefer wallet/external authentication or an approved secure credential method.
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <sqlplus-connect-identifier>" >&2
  exit 2
fi

CONNECT_ID="$1"
STAMP="$(date +%Y%m%d_%H%M%S)"
OUTDIR="output/source_${STAMP}"
mkdir -p "$OUTDIR"

for sqlfile in \
  database_inventory.sql \
  database_configuration.sql \
  schema_object_inventory.sql \
  tablespace_assessment.sql \
  invalid_objects.sql \
  database_size_assessment.sql \
  compatibility_assessment.sql
do
  echo "Running ${sqlfile}"
  sqlplus -L -s "$CONNECT_ID" @"sql/${sqlfile}" > "${OUTDIR}/${sqlfile%.sql}.txt"
done

echo "Assessment output created under: ${OUTDIR}"
