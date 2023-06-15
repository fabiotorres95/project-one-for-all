SELECT 
  u.name AS pessoa_usuaria,
  IF (MAX(h.reproduction_date) < 2021, 'Inativa', 'Ativa') AS status_pessoa_usuaria
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.history AS h ON h.user_id = u.id
GROUP BY u.id
ORDER BY u.name;