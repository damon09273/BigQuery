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
  ps.user_id IS NULL
