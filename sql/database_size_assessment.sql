-- Database storage footprint summaries. Values are allocated sizes, not backup sizes.
SET PAGESIZE 100
SET LINESIZE 220

PROMPT === DATAFILE ALLOCATION ===
SELECT ROUND(SUM(bytes)/1024/1024/1024, 2) datafiles_allocated_gb,
       ROUND(SUM(CASE WHEN autoextensible='YES' THEN maxbytes ELSE bytes END)/1024/1024/1024,2)
         datafiles_max_configured_gb
FROM   dba_data_files;

PROMPT === TEMPFILE ALLOCATION ===
SELECT ROUND(SUM(bytes)/1024/1024/1024, 2) tempfiles_allocated_gb
FROM   dba_temp_files;

PROMPT === SEGMENT ALLOCATION BY OWNER ===
SELECT owner, ROUND(SUM(bytes)/1024/1024/1024, 2) allocated_gb
FROM   dba_segments
GROUP BY owner
ORDER BY allocated_gb DESC;

PROMPT === LOB SEGMENT ALLOCATION ===
SELECT owner, ROUND(SUM(bytes)/1024/1024/1024, 2) lob_allocated_gb
FROM   dba_segments
WHERE  segment_type LIKE 'LOB%'
GROUP BY owner
ORDER BY lob_allocated_gb DESC;
