SELECT
    event_date 
    , COUNT(*) sessions
FROM 
    `doordata-course.ga4_sample.events_202012*`
WHERE 
    event_name = 'session_start'
GROUP BY
    event_date
