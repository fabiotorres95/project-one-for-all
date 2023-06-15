SELECT
  ar.artists AS artista,
  CASE
    WHEN COUNT(fa.favorite_song_id) >= 5 THEN 'A'
    WHEN COUNT(fa.favorite_song_id) BETWEEN 3 AND 4 THEN 'B'
    WHEN COUNT(fa.favorite_song_id) BETWEEN 1 AND 2 THEN 'C'
    ELSE '-'
  END AS ranking
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albums AS al ON al.artists_id = ar.id
INNER JOIN SpotifyClone.songs AS s ON s.albums_id = al.id
LEFT JOIN SpotifyClone.favorite_songs AS fa ON fa.favorite_song_id = s.id
GROUP BY ar.artists
ORDER BY COUNT(fa.favorite_song_id) DESC, artista;