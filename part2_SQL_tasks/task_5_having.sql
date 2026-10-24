SELECT clients.id, clients.full_name, COUNT(accounts.id) as cnt
from clients
	JOIN accounts
    on clients.id = accounts.client_id
GROUP by clients.id, clients.full_name
having cnt > 2;