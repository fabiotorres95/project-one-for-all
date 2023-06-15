SELECT
  CONVERT(ROUND(MIN(p.plan_price), 2), decimal(5,2)) AS faturamento_minimo,
  CONVERT(ROUND(MAX(p.plan_price), 2), decimal(5,2)) AS faturamento_maximo,
  CONVERT(ROUND(AVG(p.plan_price), 2), decimal(5,2)) AS faturamento_medio,
  CONVERT(ROUND(SUM(p.plan_price), 2), decimal(5,2)) AS faturamento_total
FROM SpotifyClone.plan AS p
INNER JOIN SpotifyClone.user AS u ON u.plan_id = p.id;