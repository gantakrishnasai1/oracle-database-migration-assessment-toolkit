-- Object inventory by owner and type. Excludes common Oracle-maintained schemas.
SET PAGESIZE 200
SET LINESIZE 220

SELECT owner, object_type, status, COUNT(*) AS object_count FROM dba_objects WHERE oracle_maintained = 'N' GROUP BY owner, object_type, status ORDER BY owner, object_type, status;

PROMPT === SCHEMA SIZE SUMMARY (MB) ===

SELECT owner, ROUND(SUM(bytes)/1024/1024, 2) AS allocated_mb FROM dba_segments WHERE  owner NOT IN ('SYS','SYSTEM') GROUP BY owner ORDER BY allocated_mb DESC;
