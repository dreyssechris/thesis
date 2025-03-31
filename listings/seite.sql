-- Zählt die Anzahl der Besuche
SELECT COUNT(DISTINCT lv.idvisit) AS total_visits
FROM log_visit lv
-- Verknüpfung der Besuche mit den durchgeführten Aktionen
JOIN log_link_visit_action lva ON lv.idvisit = lva.idvisit 
-- Verknüpfung mit den Seitentiteln (falls vorhanden)
LEFT JOIN log_action title ON lva.idaction_name = title.idaction 
-- ID der Website
WHERE lv.idsite = 1
AND lv.visit_first_action_time 
    BETWEEN FROM_UNIXTIME(${__from}/1000)  
    AND FROM_UNIXTIME(${__to}/1000)
AND (
    -- Ergebnis wird true, somit keine Filterung
    '${Seite}' = 'Übersicht'
    -- Filter je nach Auswahl der Unterseite
    OR LOWER(title.name) = LOWER('${Seite}')
    -- Alle Tagebuchseiten werden ausgewählt
    OR ('${Seite}' = 'Alle Tagebuchseiten' AND title.name REGEXP 'Blatt [0-9]{4}')
);
