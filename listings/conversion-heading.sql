(COUNT(DISTINCT visit_with_expand.idvisit) / -- Sessions mit Events
COUNT(DISTINCT visit_all.idvisit)) AS conversion_rate -- Alle Sessions