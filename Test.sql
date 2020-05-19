Select * from vermietung where enddatum > current_date - 2;
--70ms

CREATE INDEX vermietung_enddatum ON vermietung(enddatum);

Select * from vermietung where enddatum > current_date - 2;
--50ms



Select * from vermietung where startdatum between '2019-12-30 00:00:01.000000' and '2019-12-30 23:59:59.000000';
--60ms

CREATE INDEX vermietung_startdatum ON vermietung(startdatum);

Select * from vermietung where startdatum between '2019-12-30 00:00:01.000000' and '2019-12-30 23:59:59.000000';
--50ms

--Drop index vermietung_startdatum;

Select * from vermietung where startdatum = '2019-12-30 09:54:44.000000' and  enddatum = '2019-09-16 01:06:59.000000';
--50ms
CREATE INDEX vermietung_start_enddatum on vermietung(startdatum,enddatum);

Select * from vermietung where startdatum = '2019-12-30 09:54:44.000000' and  enddatum = '2019-09-16 01:06:59.000000';
--40ms

--drop index  vermietung_start_enddatum;