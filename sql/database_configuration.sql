-- Selected configuration and recovery attributes.
SET PAGESIZE 100
SET LINESIZE 220

PROMPT === DATABASE PROTECTION / RECOVERY SETTINGS ===

SELECT name, value FROM v$parameter WHERE  name IN (
  'compatible', 'db_block_size', 'processes', 'sessions',
  'cluster_database', 'control_file_record_keep_time',
  'undo_retention', 'remote_login_passwordfile',
  'parallel_degree_policy', 'optimizer_features_enable'
)
ORDER BY name;

PROMPT === ARCHIVE / FORCE LOGGING / FLASHBACK ===

SELECT log_mode, force_logging, flashback_on, supplemental_log_data_min FROM   v$database;

PROMPT === REDO LOG GROUPS ===

SELECT thread#, group#, bytes/1024/1024 AS size_mb,members, archived, status FROM v$log ORDER BY thread#, group#;

PROMPT === SUPPLEMENTAL LOGGING ===

SELECT supplemental_log_data_min, supplemental_log_data_pk,
       supplemental_log_data_ui, supplemental_log_data_fk,
       supplemental_log_data_all
FROM   v$database;
