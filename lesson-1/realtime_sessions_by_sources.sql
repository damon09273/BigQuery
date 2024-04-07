SELECT
  CASE
    WHEN collected_traffic_source.manual_source IS NULL THEN '(direct) / (none)'
  ELSE
  CONCAT(collected_traffic_source.manual_source, ' / ', collected_traffic_source.manual_medium)
END
  AS source_medium,
  COUNT(*) sessions
FROM
  `project.dataset.events_intraday_YYYYMMDD`
  --  替換成你自己的即時表格
WHERE
  event_name = 'session_start'
  AND TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), TIMESTAMP_MICROS(event_timestamp), MINUTE) <= 30
GROUP BY
  1
