-- Backup e Recovery
-- Backup com mysqldump
mysqldump -u usuario -p Ecommerce > Ecommerce_backup.sql

-- Recuperaçao
mysql -u usuario -p Ecommerce < Ecommerce_backup.sql

-- Backup com Procedimentos e Eventos:

mysqldump -u usuario -p --routines Ecommerce > Ecommerce_completo_backup.sql