-- Database inventory. Read-only. Run as an authorized assessment account.
SET VERIFY OFF
SET FEEDBACK ON
SET PAGESIZE 100
SET LINESIZE 220
SET TRIMSPOOL ON

PROMPT === DATABASE INVENTORY ===
SELECT name, dbid, db_unique_name, database_role, open_mode,
       log_mode, force_logging, platform_name, cdb
FROM   v$database;

PROMPT === INSTANCE INVENTORY ===
SELECT inst_id, instance_name, host_name, version, status,
       parallel, thread#, startup_time
FROM   gv$instance
ORDER BY inst_id;

PROMPT === DATABASE VERSION ===
SELECT banner
FROM   v$version
ORDER BY banner;

PROMPT === CHARACTER SETS ===
SELECT parameter, value
FROM   nls_database_parameters
WHERE  parameter IN ('NLS_CHARACTERSET', 'NLS_NCHAR_CHARACTERSET')
ORDER BY parameter;

PROMPT === TIME ZONE FILE ===
SELECT filename, version
FROM   v$timezone_file;
