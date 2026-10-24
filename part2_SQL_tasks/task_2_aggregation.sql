SELECT currency, SUM(*) FROM accounts
WHERE closed_at is NULL;
group by currency;