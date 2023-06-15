SELECT
  u.name AS pessoa_usuaria,
  COUNT(h.songs_id) AS musicas_ouvidas,
  CONVERT(ROUND(SUM(s.duration_seconds / 60), 2), decimal(5,2)) AS total_minutos
FROM SpotifyClone.user AS u 
INNER JOIN SpotifyClone.history AS h ON h.user_id = u.id
INNER JOIN SpotifyClone.songs AS s ON h.songs_id = s.id
GROUP BY u.name
ORDER BY u.name;