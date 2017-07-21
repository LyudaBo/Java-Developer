use homework_1;

-- 6. Вычислить, среднюю ЗП программистов в проекте, который приносит наименьшую прибыль.

SELECT projects.PROJECT_NAME, projects.cost, avg(dev_salary) FROM developers
INNER JOIN developer_project ON developers.DEVELOPER_ID = developer_project.DEVELOPER_ID
INNER JOIN projects ON developer_project.PROJECT_ID = projects.PROJECT_ID
WHERE projects.cost = (SELECT min(cost) FROM projects);