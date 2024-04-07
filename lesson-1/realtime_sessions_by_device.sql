-- 即時報表 by 裝置
SELECT
  device.category,
  COUNT(*) AS devices
FROM
  -- 換成你的表格
  `project.dataset.events_intraday_YYYYMMDD`
WHERE
  event_name = 'session_start'
  AND TIMESTAMP_MICROS(event_timestamp) >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 MINUTE)
GROUP BY
  device.category
