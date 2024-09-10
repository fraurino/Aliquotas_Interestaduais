--Database Firebird 2.5.

CREATE TABLE aliquotas_icms (
    ID  INTEGER NOT NULL,
    origem VARCHAR(2) NOT NULL,
    destino VARCHAR(2) NOT NULL,
    aliquota DECIMAL(4,2) NOT NULL
);
ALTER TABLE aliquotas_icms ADD PRIMARY KEY (ID);
CREATE SEQUENCE GEN_ALIQUOTAS_ICMS_ID;

SET TERM ^ ;

create procedure sp_gen_aliquotas_icms_id
returns (id integer)
as
begin
  id = gen_id(gen_aliquotas_icms_id, 1);
  suspend;
end^

SET TERM ; ^

SET TERM ^ ;

create trigger aliquotas_icms_bi for aliquotas_icms
active before insert position 0
as
begin
  if (new.id is null) then
    new.id = gen_id(gen_aliquotas_icms_id,1);
end^

SET TERM ; ^

CREATE INDEX ALIQUOTAS_ICMS_IDX3
ON ALIQUOTAS_ICMS (DESTINO);

CREATE INDEX ALIQUOTAS_ICMS_IDX2
ON ALIQUOTAS_ICMS (ORIGEM);

CREATE INDEX ALIQUOTAS_ICMS_IDX1
ON ALIQUOTAS_ICMS (ORIGEM,DESTINO);




