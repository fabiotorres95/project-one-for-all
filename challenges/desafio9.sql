SELECT COUNT(h.songs_id) AS musicas_no_historico
FROM SpotifyClone.history AS h
WHERE h.user_id = 1;