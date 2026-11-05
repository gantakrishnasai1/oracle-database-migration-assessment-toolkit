-- Permanent tablespace capacity summary. Includes autoextend maximum where available.
SET PAGESIZE 100
SET LINESIZE 220

WITH df AS (
  SELECT tablespace_name,
         SUM(bytes) allocated_bytes,
         SUM(CASE WHEN autoextensible = 'YES' THEN maxbytes ELSE bytes END) max_bytes
  FROM   dba_data_files
  GROUP BY tablespace_name
),
fs AS (
  SELECT tablespace_name, SUM(bytes) free_bytes
  FROM   dba_free_space
  GROUP BY tablespace_name
)
SELECT d.tablespace_name,
       ROUND(d.allocated_bytes/1024/1024/1024, 2) allocated_gb,
       ROUND(NVL(f.free_bytes,0)/1024/1024/1024, 2) free_gb,
       ROUND((d.allocated_bytes-NVL(f.free_bytes,0))/1024/1024/1024, 2) used_gb,
       ROUND(d.max_bytes/1024/1024/1024, 2) max_configured_gb,
       ROUND(100*(d.allocated_bytes-NVL(f.free_bytes,0))/NULLIF(d.allocated_bytes,0), 2) used_pct
FROM   df d
LEFT JOIN fs f ON f.tablespace_name = d.tablespace_name
ORDER BY used_pct DESC;

PROMPT === TEMPORARY TABLESPACE FILES ===
SELECT tablespace_name, file_name,
       ROUND(bytes/1024/1024/1024,2) current_gb,
       autoextensible,
       ROUND(maxbytes/1024/1024/1024,2) max_gb
FROM   dba_temp_files
ORDER BY tablespace_name, file_name;
