SELECT
  projects.id,
  projects.name,
  projects.key,
  projects.lead_id,
  accounts.username as username
  FROM projects
  INNER JOIN accounts ON projects.lead_id = accounts.id
