-- 使用事件資料-多重條件

WITH pivoted AS (
  SELECT 
    (SELECT eps.value.string_value FROM UNNEST(event_params) AS eps WHERE eps.key = 'page_location') AS url,
    (SELECT CASE WHEN eps.value.int_value = 1 THEN true ELSE false END FROM UNNEST(event_params) AS eps WHERE eps.key = 'entrances') AS is_entrances,
  FROM `doordata-course.ga4_sample.events_20210131`
  WHERE
    event_name = 'page_view'
)

SELECT url, COUNT(*) pv
FROM pivoted
WHERE is_entrances
GROUP BY 1
ORDER BY 2 DESC
