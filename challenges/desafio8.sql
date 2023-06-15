SELECT 
  ar.artists AS artista,
  al.album AS album
FROM SpotifyClone.artists AS ar
INNER JOIN SpotifyClone.albums AS al ON ar.id = al.artists_id
WHERE ar.artists = 'Elis Regina'
ORDER BY album;