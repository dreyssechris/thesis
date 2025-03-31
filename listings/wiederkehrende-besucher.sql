COUNT(DISTINCT 
    CASE 
        WHEN log_visit.visitor_returning = 1 THEN log_visit.idvisitor 
    END) 
/
COUNT(DISTINCT lv.idvisitor)
