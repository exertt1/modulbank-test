SELECT * FROM clients
	WHERE city = 'Новосибирск'
    and EXTRACT(year FROM registered_at) = 2025;