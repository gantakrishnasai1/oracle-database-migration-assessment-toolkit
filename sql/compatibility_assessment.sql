-- Inventory of selected features that may affect migration design.
-- This is not an automated compatibility verdict. Review target service restrictions.
SET PAGESIZE 150
SET LINESIZE 220

PROMPT === DATABASE OPTIONS ===
SELECT parameter, value
FROM   v$option
ORDER BY parameter;

PROMPT === COMPONENT REGISTRY ===
SELECT comp_id, comp_name, version, status
FROM   dba_registry
ORDER BY comp_id;

PROMPT === NON-DEFAULT INITIALIZATION PARAMETERS ===
SELECT name, value, isdefault, issys_modifiable
FROM   v$parameter
WHERE  isdefault = 'FALSE'
ORDER BY name;

PROMPT === DIRECTORY OBJECTS (METADATA ONLY) ===
SELECT owner, directory_name
FROM   dba_directories
ORDER BY owner, directory_name;

PROMPT === DATABASE LINKS (NAMES ONLY; REVIEW PRIVATELY) ===
SELECT owner, db_link, username, host
FROM   dba_db_links
ORDER BY owner, db_link;

