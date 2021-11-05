-- Copyright (c) 2021 Linux Foundation
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

create or replace function dm.dm_insert_sqlserver() returns void as $$ begin IF NOT EXISTS (SELECT 1 FROM dm.dm_type WHERE name = 'SQL Server') THEN insert into dm.dm_type (id,name, database, deletedir, domainid, status, creatorid, modifierid) (select max(id)+1 as id,'SQL Server' as name, 'N', 'N', 1, 'N', 1, 1 from dm.dm_type);END IF;end;$$ LANGUAGE plpgsql;