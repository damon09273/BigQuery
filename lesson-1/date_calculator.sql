SELECT
  DATE_SUB(CURRENT_DATE('Asia/Taipei'), INTERVAL 3 MONTH) before_3_month,
  CURRENT_DATE('Asia/Taipei') today,
  DATE_ADD(CURRENT_DATE('Asia/Taipei'), INTERVAL 3 MONTH) AS after_3_month
