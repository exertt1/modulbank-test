SELECT account_id, tx_date, amount, Count(*) as cnt
FROM transactions 
group by account_id, tx_date, amount
HAVING cnt > 1