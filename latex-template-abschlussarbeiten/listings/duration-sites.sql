(
    SELECT
        -- Verweildauer entspricht der Differenz zwischen Startzeit und errechnteter Endzeit
        ROUND(AVG(TIMESTAMPDIFF(SECOND, start_time, end_time)) / 60, 2) AS avg_time_on_page_minutes
    FROM (
        SELECT
            -- Zeitpunkt der letzten Aktion auf der Seite
            lva1.server_time AS start_time,  

            -- Bestimmung der Endzeit, indem der nachfolgende Zeitstempel zu start_time bestimmt wird
            (
                SELECT MIN(lva2.server_time)
                FROM log_link_visit_action lva2
                -- Prüft, ob es sich bei der Aktion um einen Seitenaufruf handelt, da Aktionen auch Events sein können
                LEFT JOIN log_action next_url ON lva2.idaction_url = next_url.idaction
                -- Es werden nur Aktionen innerhalb einer Sitzung verwendet
                WHERE lva2.idvisit = lva1.idvisit
                -- Nur Aktionen filtern, welche nach der start_time folgen 
                  AND lva2.server_time > lva1.server_time
                  AND next_url.type = 1  -- ID für URL's, da Events nicht beachtet werden sollen 
            ) AS end_time

