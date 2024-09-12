SELECT
    PARSE_DATE('%Y%m%d',event_date) AS date
    , COUNT(*) sessions
FROM 
    `doordata-course.ga4_sample.events_202012*`
WHERE 
    event_name = 'session_start'
GROUP BY
    date
ORDER BY
    date