-- Erstellt einen neuen Datenbanknutzer mit einen Passwort
CREATE USER 'grafana_read'@'%' IDENTIFIED BY 'grafana';

-- Nutzer erhält nur Lesezugriff auf die Datenbank
GRANT SELECT ON matomo.* TO 'grafana_read'@'%';

-- Berechtigungen werden aktualisiert
FLUSH PRIVILEGES;