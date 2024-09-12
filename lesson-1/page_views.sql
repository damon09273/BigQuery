SELECT
  event_name,
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location') AS page_location,
  COUNT(*) AS page_views
FROM
  `doordata-course.ga4_sample.events_20210122`
WHERE
  event_name = 'page_view'
GROUP BY
  event_name,
  page_location
ORDER BY
  page_views DESC
