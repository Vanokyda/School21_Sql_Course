WITH cleaned_currency AS (
    SELECT c.id,
        c.name
    FROM currency c
    GROUP BY c.id,
        c.name
)
SELECT name,
    lastname,
    currency_name,
    (money * final_rate)::real AS currency_in_usd
FROM (
        SELECT COALESCE(u.name, 'not defined') AS name,
            COALESCE(u.lastname, 'not defined') AS lastname,
            cc.name AS currency_name,
            b.money,
            COALESCE(
                (
                    SELECT rate_to_usd
                    FROM currency c
                    WHERE c.id = b.currency_id
                        AND c.updated < b.updated
                    ORDER BY c.updated DESC
                    LIMIT 1
                ), (
                    SELECT rate_to_usd
                    FROM currency c
                    WHERE c.id = b.currency_id
                        AND c.updated > b.updated
                    ORDER BY c.updated
                    LIMIT 1
                )
            ) AS "final_rate"
        FROM balance b
            FULL JOIN "user" u ON b.user_id = u.id
            JOIN cleaned_currency cc ON b.currency_id = cc.id
    ) AS final
ORDER BY 1 DESC,
    2,
    3;