SELECT
    DATE(ts.submitted_at) AS date,
    COUNT(DISTINCT ts.session_id) AS unique_sessions
FROM
    kb.tour_steps AS ts
WHERE
    ts.tour_step = 0
    AND ts.submitted_at >= '{START_DATE}'
GROUP BY
    DATE(ts.submitted_at)
ORDER BY
    DATE(ts.submitted_at) DESC