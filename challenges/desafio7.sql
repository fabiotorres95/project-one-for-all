SELECT 
  ar.artists AS artista,
  al.album AS album,
  COUNT(fa.user_id) AS pessoas_seguidoras
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albums AS al ON ar.id = al.artists_id
INNER JOIN SpotifyClone.followed_artists AS fa ON fa.artists_id = ar.id
GROUP BY album, artista
ORDER BY pessoas_seguidoras DESC, artista, album;