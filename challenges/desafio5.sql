SELECT
  s.song AS cancao,
  COUNT(h.songs_id) AS reproducoes
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.history AS h ON h.songs_id = s.id
GROUP BY cancao 
ORDER BY reproducoes DESC, s.song
LIMIT 2;