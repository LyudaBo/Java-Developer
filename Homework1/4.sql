use homework_1;

ALTER TABLE projects ADD cost INT(6) AFTER PROJECT_NAME;

UPDATE projects SET cost=1000 WHERE PROJECT_ID=1;
UPDATE projects SET cost=2000 WHERE PROJECT_ID=1;
UPDATE projects SET cost=3000 WHERE PROJECT_ID=1;