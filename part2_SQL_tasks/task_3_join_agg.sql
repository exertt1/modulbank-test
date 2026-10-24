SELECT clients.name, sum(transactions.amount)
FROM clients
	inner join accounts
    on clients.id = accounts.client_id
    	INNER join transactions
        on accounts.id = transactions.account_id
	where transactions.tx_type = 'in'
GROUP BY clients.id, clients.full_name