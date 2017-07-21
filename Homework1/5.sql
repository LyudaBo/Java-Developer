SELECT
  customers.CUSTOMER_NAME,
  min(cost) as min_income
FROM (SELECT
        CUSTOMER_ID,
        COMPANY_ID,
        min(cost) AS cost
      FROM projects
      GROUP BY CUSTOMER_ID, COMPANY_ID) AS t1
  LEFT JOIN customers ON t1.CUSTOMER_ID = customers.CUSTOMER_ID
GROUP BY CUSTOMER_NAME;