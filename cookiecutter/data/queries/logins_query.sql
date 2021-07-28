SELECT ul.*, rs.email 
FROM kb.user_logged AS ul
    JOIN kb.user_registered AS ur ON (ul.user_id = ur.user_id)
    JOIN kb.recurly_subscriptions AS rs ON (ur.email=rs.email) 
WHERE ul.logged_at >= {START_DATE}