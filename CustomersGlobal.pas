unit CustomersGlobal;

interface

const
  NAME_FILE_OPTION = 'Config.ini';
  SQL_SELECT_SIMKA =
    'select '+
      'simka.sphone_nmbr, operator.optitle, owner.oname, owner.oidprsnl_acnt, tdevice.tdtitle, tarif_plan.tptitle, rltnshp.rtitle, service.srtitle, ' +
      'simka.sicc_sim, simka.spuk1, simka.spuk2, simka.sactive, simka.spayment, simka.sclir, simka.sclir_price, simka.sinstall, simka.sradrsng_all, simka.snum_radrsng_all, ' +
      'simka.sradrsng_busy, simka.snum_radrsng_busy, simka.sradrsng_noanswr, simka.snum_radrsng_noanswr, simka.sradrsng_outsd, simka.sid ' +
    'from tdevice ' +
      'right outer join simka on (tdevice.tdid = simka.st_device) ' +
      'left outer join operator on (simka.soperator = operator.opid) ' +
      'left outer join owner on (simka.sowner = owner.oid) ' +
      'left outer join tarif_plan on (simka.starif_plan = tarif_plan.tpid) ' +
      'left outer join rltnshp on (simka.st_rlnshp = rltnshp.rid) ' +
      'left outer join service on (simka.sservice = service.srid) ';

implementation

end.
