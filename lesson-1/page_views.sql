SELECT
  event_name,
  (SELECT value.string_value FROM UNNEST(event_params) WHERE key = 'page_location') AS page_location,
  COUNT(*) AS page_views
FROM
  `doordata-course.ga4_sample.events_20210122`  -- 替換成你的專案 ID 和資料集 ID
WHERE
  event_name = 'page_view'  -- 假設 'page_view' 是網頁瀏覽事件的名稱
GROUP BY
  event_name,
  page_location
ORDER BY
  page_views DESC;
