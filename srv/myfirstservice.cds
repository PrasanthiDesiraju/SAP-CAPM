using { epm.db } from '../db/datamodel';

service mysrv {
    function hello (to:String) returns String;
    
  @readonly
  entity ReadEmployeeSrv as projection on db.master.employees;

  @insertonly
  entity InsertEmployeeSrv as projection on db.master.employees;

  @updateonly
  entity UpdateEmployeeSrv as projection on db.master.employees;

  @deleteonly
  entity DeleteEmployeeSrv as projection on db.master.employees;
  }