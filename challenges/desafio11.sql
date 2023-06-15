SELECT
  al.album AS album,
  COUNT(fa.favorite_song_id) AS favoritadas
FROM SpotifyClone.albums AS al
INNER JOIN SpotifyClone.songs AS s ON s.albums_id = al.id
INNER JOIN SpotifyClone.favorite_songs AS fa ON fa.favorite_song_id = s.id
GROUP BY album
ORDER BY favoritadas DESC, album
LIMIT 3;