  -- 2020 年的工作階段數
SELECT
  FORMAT_DATE('%Y年 %B', PARSE_DATE('%Y%m%d', event_date)) AS year_month,
  COUNT(*) AS sessions
FROM
  `doordata-course.ga4_sample.events_*`
WHERE
  event_name = 'session_start'
  AND _TABLE_SUFFIX BETWEEN '20200101'
  AND '20201231'
GROUP BY
  event_date
ORDER BY
  event_date
