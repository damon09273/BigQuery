SELECT
  user_id,
  TIMESTAMP_MICROS(MAX(event_timestamp)) latest_purchases
FROM
  `doordata-course.ga4_sample.events_*`
WHERE
  event_name = 'purchase'
  AND _TABLE_SUFFIX BETWEEN '20210122'
  AND '20210124'
GROUP BY
  1
