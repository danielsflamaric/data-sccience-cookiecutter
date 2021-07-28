SELECT
    DATE(a.date) AS date,
    ROUND(SUM(a.adspent),2) AS adspent
FROM
    funnel_io.adspent AS a
WHERE
    a.product_name = 'KetoBody'
    AND a.date >= '{START_DATE}'
GROUP BY
    DATE(a.date)
ORDER BY
    DATE(a.date) DESC