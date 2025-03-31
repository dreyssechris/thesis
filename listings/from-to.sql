SELECT *
FROM log_visit AS visit
WHERE visit.visit_first_action_time 
BETWEEN FROM_UNIXTIME(${__from}/1000) 
AND FROM_UNIXTIME(${__to}/1000);