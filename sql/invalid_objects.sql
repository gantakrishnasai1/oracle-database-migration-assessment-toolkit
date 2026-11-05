-- Invalid non-Oracle-maintained objects.
SET PAGESIZE 200
SET LINESIZE 220

SELECT owner, object_type, object_name, status
FROM   dba_objects
WHERE  status <> 'VALID'
AND    oracle_maintained = 'N'
ORDER BY owner, object_type, object_name;

PROMPT === INVALID OBJECT COUNTS ===
SELECT owner, object_type, COUNT(*) invalid_count
FROM   dba_objects
WHERE  status <> 'VALID'
AND    oracle_maintained = 'N'
GROUP BY owner, object_type
ORDER BY owner, object_type;
