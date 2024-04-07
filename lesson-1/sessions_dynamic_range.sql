SELECT
  event_date,
  COUNT(*)
FROM
  `doordata-course.ga4_sample.events_*`
WHERE
  event_name = 'session_start'
  AND _TABLE_SUFFIX >= FORMAT_DATE('%Y%m%d', DATE_SUB(CURRENT_DATE('Asia/Taipei'), INTERVAL 9000 DAY))
GROUP BY
  event_date
ORDER BY
  event_date
