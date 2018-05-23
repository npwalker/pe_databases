## Minor Release 0.14.0

- Make compatible with PE 2018.1 [#17](https://github.com/npwalker/pe_databases/pull/17)

## Minor Release 0.13.0

 - Manage certnames and catalogs tables autovacuum_vacuum_scale_factor [#14](https://github.com/npwalker/pe_databases/pull/14)
 - Change way we cast strings to appease puppet lint

## Z Release 0.12.1

 - Add `--analyze` during VACUUM FULL commands run in maintenance [#13](https://github.com/npwalker/pe_databases/pull/13)

## Minor Release 0.12.0

 - Improve maintenance cron jobs [#12](https://github.com/npwalker/pe_databases/pull/12)
   - Change from reindexing all tables to VACUUM FULL on just the smaller tables

## Z Release 0.11.2

 - Fix metadata.json version

## Z Release 0.11.1

 - Correct logic for detecting PostgreSQL version

## Minor Release 0.11.0

 - Prepare for PostgreSQL 9.6 in PE 2017.3.0
 - Manage fact_values autovacuum again in 2017.3.0

## Z Release 0.10.1

 - Bug Fixes
   - Do not manage fact_values auto vacuum on PE 2017.2.0
