WITH
  add_to_carts AS (
  SELECT
    user_id,
    TIMESTAMP_MICROS(MIN(event_timestamp)) firtest_add_to_cart
  FROM
    `doordata-course.ga4_sample.events_20210122`
  WHERE
    event_name = 'add_to_cart'
  GROUP BY
    1 ),
  purchases AS (
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
    1),
  users_to_notify AS (
  SELECT
    carts.*
  FROM
    add_to_carts AS carts
  LEFT JOIN
    purchases AS ps
  ON
    carts.user_id = ps.user_id
    AND carts.firtest_add_to_cart < ps.latest_purchases
  WHERE
    ps.user_id IS NULL )
SELECT
  users.*
FROM
  users_to_notify AS utn
JOIN
  `doordata-course.your_database.users` users
ON
  utn.user_id = users.user_id
