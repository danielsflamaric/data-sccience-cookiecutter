SELECT
    DATE(mc.created_at) AS date,
    COUNT(DISTINCT mc.membership_id) AS primary_sales
FROM
    kb.membership_created mc
LEFT JOIN kb.user_registered ur ON
    ur.user_id = mc.user_id
WHERE
    mc.product_id = 1
    AND mc.created_at >= '{START_DATE}'
    AND ur.email NOT LIKE '%%@teamcmp.com'
    AND ur.email NOT LIKE '%%@moarmarketing.com'
GROUP BY
    DATE(mc.created_at)
ORDER BY 
    DATE(mc.created_at) DESC