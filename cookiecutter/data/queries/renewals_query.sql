SELECT
    DATE(t."date") AS renewal_date,
    COUNT(DISTINCT t.transaction_id) AS renewals
FROM
    kb.recurly_transactions AS t
LEFT JOIN kb.recurly_accounts ra ON
    ra.account_code = t.account_code
WHERE
    t.origin = 'recurring'
    AND t.status = 'success'
    AND t."date" >= '{START_DATE}'
    AND ra.account_email NOT LIKE '%%@teamcmp.com'
    AND ra.account_email NOT LIKE '%%@moarmarketing.com'
GROUP BY
    DATE(t."date")
ORDER BY
    DATE(t."date") DESC