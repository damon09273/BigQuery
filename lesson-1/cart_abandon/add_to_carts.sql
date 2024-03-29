SELECT
  user_id,
  TIMESTAMP_MICROS(MIN(event_timestamp)) firtest_add_to_cart
FROM
  `doordata-course.ga4_sample.events_20210122`
WHERE
  event_name = 'add_to_cart'
GROUP BY
  1
