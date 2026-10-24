SELECT clients.id, clients.full_name FROM clients
LEFT JOIN accounts
on clients.id = accounts.client_id
WHERE accounts.client_id is NULL