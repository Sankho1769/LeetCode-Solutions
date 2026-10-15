SELECT DISTINCT c.title
FROM TVProgram t JOIN Content c ON c.content_id = t.content_id
WHERE t.program_date >= '2020-06-01' AND t.program_date < '2020-07-01'
  AND c.content_type = 'Movies' AND c.Kids_content = 'Y';
