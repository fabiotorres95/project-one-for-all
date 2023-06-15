 SELECT
  COUNT(DISTINCT s.id) AS cancoes,
  COUNT(DISTINCT ar.id) AS artistas,
  COUNT(DISTINCT al.id) AS albuns
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albums AS al
INNER JOIN SpotifyClone.songs AS s;