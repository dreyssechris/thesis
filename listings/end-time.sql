-- Zeitpunkt der aktuellen Seiteninteraktion (Startzeit der Seite)
server_time AS start_time,  

-- Bestimmt den Zeitpunkt der nächsten Seiteninteraktion innerhalb derselben Sitzung (Endzeit der Seite)
(
    SELECT MIN(lva2.server_time)  -- Wählt den frühesten (zeitlich nächsten) Seitenaufruf nach der aktuellen Aktion
    FROM matomo_log_link_visit_action lva2
    -- Verknüpft mit der Aktionstabelle, um zu prüfen, ob es sich bei der Aktion um einen Seitenaufruf handelt
    LEFT JOIN matomo_log_action next_url 
      ON lva2.idaction_url = next_url.idaction
    WHERE 
        lva2.idvisit = lva1.idvisit  -- Nur Aktionen derselben Sitzung betrachten
        AND lva2.server_time > lva1.server_time  -- Nur Aktionen, die nach der aktuellen Aktion erfolgt sind
        AND next_url.type = 1  -- Nur Aktionen vom Typ „Seitenaufruf“ (type = 1) einbeziehen
) AS end_time

