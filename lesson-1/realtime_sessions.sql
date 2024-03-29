SELECT
  COUNT(*) sessions
FROM
  `doordata09273.analytics_271820639.events_intraday*`
  --  替換成你自己的即時表格
WHERE
  event_name = 'session_start'
  AND
  TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), TIMESTAMP_MICROS(event_timestamp), MINUTE) <= 30
