# 使用事件資料
SELECT eps.value.string_value AS url, COUNT(*) AS pv
FROM `doordata-course.ga4_sample.events_20210131`, UNNEST(event_params) AS eps
WHERE key = 'page_location' AND event_name = 'page_view'
GROUP BY 1
ORDER BY 2 DESC
