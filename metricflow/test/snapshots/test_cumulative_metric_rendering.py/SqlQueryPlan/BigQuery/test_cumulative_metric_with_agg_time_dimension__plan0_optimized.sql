-- Join Self Over Time Range
-- Pass Only Elements: ['txn_revenue', 'revenue_instance__ds__day']
-- Aggregate Measures
-- Compute Metrics via Expressions
SELECT
  subq_10.ds AS revenue_instance__ds__day
  , SUM(revenue_src_10007.revenue) AS trailing_2_months_revenue
FROM ***************************.mf_time_spine subq_10
INNER JOIN
  ***************************.fct_revenue revenue_src_10007
ON
  (
    DATE_TRUNC(revenue_src_10007.created_at, day) <= subq_10.ds
  ) AND (
    DATE_TRUNC(revenue_src_10007.created_at, day) > DATE_SUB(CAST(subq_10.ds AS DATETIME), INTERVAL 2 month)
  )
GROUP BY
  revenue_instance__ds__day
