-- The contents of this file are subject to the MonetDB Public License
-- Version 1.1 (the "License"); you may not use this file except in
-- compliance with the License. You may obtain a copy of the License at
-- http://www.monetdb.org/Legal/MonetDBLicense
--
-- Software distributed under the License is distributed on an "AS IS"
-- basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
-- License for the specific language governing rights and limitations
-- under the License.
--
-- The Original Code is the MonetDB Database System.
--
-- The Initial Developer of the Original Code is CWI.
-- Copyright August 2008-2013 MonetDB B.V.
-- All Rights Reserved.

-- show the optimizer statistics maintained by the SQL frontend
create function optimizer_stats () 
	returns table (rewrite string, count int) 
	external name sql.dump_opt_stats;


-- SQL QUERY CACHE
-- The SQL query cache returns a table with the query plans kept

create function queryCache() 
	returns table (query string, count int) 
	external name sql.dump_cache;

-- Trace the SQL input
create procedure querylog(filename string) 
	external name sql.logfile;

-- MONETDB KERNEL SECTION
-- optimizer pipe catalog
create function optimizers () 
	returns table (name string, def string, status string)
	external name sql.optimizers;

-- The environment table
create function environment()
	returns table ("name" string, value string)
	external name sql.sql_environment;

-- The BAT buffer pool overview
create function bbp () 
	returns table (id int, name string, htype string, 
		ttype string, count BIGINT, refcnt int, lrefcnt int, 
		location string, heat int, dirty string, 
		status string, kind string) 
	external name sql.bbp;

create procedure evalAlgebra( ra_stmt string, opt bool)
	external name sql."evalAlgebra";
