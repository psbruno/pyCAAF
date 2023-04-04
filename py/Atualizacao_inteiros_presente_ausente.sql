use caaf;
ALTER TABLE caaf.conteudo_osso_info MODIFY COLUMN ossic_ouvido varchar(20);
ALTER TABLE caaf.conteudo_osso_info MODIFY COLUMN osso_pe varchar(20);
ALTER TABLE caaf.conteudo_osso_info MODIFY COLUMN osso_mao varchar(20);

UPDATE caaf.conteudo_osso_info
SET caaf.conteudo_osso_info.ossic_ouvido = "presente"
WHERE caaf.conteudo_osso_info.ossic_ouvido > "0" and caaf.conteudo_osso_info.ossic_ouvido not in ("presente", "ausente");

UPDATE caaf.conteudo_osso_info
SET caaf.conteudo_osso_info.ossic_ouvido = "ausente"
WHERE caaf.conteudo_osso_info.ossic_ouvido = "0" and caaf.conteudo_osso_info.ossic_ouvido not in ("presente", "ausente");

UPDATE caaf.conteudo_osso_info
SET caaf.conteudo_osso_info.osso_mao = "presente"
WHERE caaf.conteudo_osso_info.osso_mao > "0" and caaf.conteudo_osso_info.osso_mao not in ("presente", "ausente");

UPDATE caaf.conteudo_osso_info
SET caaf.conteudo_osso_info.osso_mao = "ausente"
WHERE caaf.conteudo_osso_info.osso_mao = "0" and caaf.conteudo_osso_info.osso_mao not in ("presente", "ausente");

UPDATE caaf.conteudo_osso_info
SET caaf.conteudo_osso_info.osso_pe = "presente"
WHERE caaf.conteudo_osso_info.osso_pe > "0" and caaf.conteudo_osso_info.osso_pe not in ("presente", "ausente");

UPDATE caaf.conteudo_osso_info
SET caaf.conteudo_osso_info.osso_pe = "ausente"
WHERE caaf.conteudo_osso_info.osso_pe = "0" and caaf.conteudo_osso_info.osso_pe not in ("presente", "ausente");