SELECT
    COUNT(*) AS Besuche,
    -- Die URL der verweisenden Website
    visit.referer_url AS Referrer, 
    -- Zählt die Anzahl der Besuche mit nur einer Aktion (Absprünge)
    SUM(visit.visit_total_actions = 1) AS Bounce_Count
FROM matomo_log_visit AS visit
WHERE visit.idsite = 1 
AND (
    visit.referer_type = 2     -- Besuche über Suchmaschinen
    OR visit.referer_type = 3  -- Besuche über externen Websites
    OR visit.referer_type = 6  -- Besuche über bezahlte Anzeigen
    OR visit.referer_type = 7  -- Besuche über soziale Netzwerke
)
-- Nur Besuche, welche Referer haben werden beachtet
AND visit.referer_url IS NOT NULL
AND visit.visit_first_action_time 
    BETWEEN FROM_UNIXTIME(${__from}/1000)
    AND FROM_UNIXTIME(${__to}/1000)
-- Ergebnisse werden nach der Referrer-URL gruppiert    
GROUP BY visit.referer_url
-- Für die Sortierrichtung wird die Variable verwendet
ORDER BY Besuche ${Sort};
