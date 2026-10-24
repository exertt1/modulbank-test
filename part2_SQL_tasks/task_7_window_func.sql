with MonthlySum AS (
	select 
  		clients.id,
  		clients.full_name,
  		DATE_TRUNC('month', transactions.tx_date) as monthh,
  		SUM(transactions.amount) as montly_out_sum
  	from clients
  		JOIN accounts
  		on clients.id = accounts.client_id
  		join transactions
  		on accounts.id = transactions.account_id
  	where transactions.tx_type = 'out'
  	group by clients.id, clients.full_name, DATE_TRUNC('month', transactions.tx_date)
),
RankedClients as (
	select *,
  		rank() over (PARTITION BY monthh order by monthly_out_sum desc) as rnk
  	from MontlySum
)

select clients.id, clients.full_name, rk.monthly_out_sum
from RankedClients
where rnk <= 3
order by monthh, rnk
    