SELECT 
    CASE 
        -- Tagebuchseiten erhalten den Titel Blatt XXXX
        WHEN log_action_title.name REGEXP 'Blatt [0-9]{4}' 
        THEN REGEXP_SUBSTR(log_action_title.name, 'Blatt [0-9]{4}')
        -- Für andere Seiten wird der gesamte Seitentitel verwendet
        ELSE log_action_title.name
    END AS page_title, 
    -- Seitenaurufe werden summiert
    COUNT(*) AS page_views
FROM log_link_visit_action
-- Verknüpfung um die Seitentiteln zu erhalten
JOIN log_action AS log_action_title 
    ON log_action_title.idaction = log_link_visit_action.idaction_name
    -- Beschränkt auf Titel (type = 4 steht für Seiten-Titel in Matomo)
    AND log_action_title.type = 4
JOIN log_visit AS visit
    ON visit.idvisit = log_link_visit_action.idvisit
WHERE log_link_visit_action.idsite = 1
AND visit.visit_first_action_time BETWEEN FROM_UNIXTIME(${__from}/1000) AND FROM_UNIXTIME(${__to}/1000)
-- Gruppierung nach dem Seitentitel
GROUP BY page_title
-- Sortierung nach Anzahl der Seitenaufrufe
ORDER BY page_views ${Sort}
-- Begrenzung auf 10 Unterseiten
LIMIT 10;