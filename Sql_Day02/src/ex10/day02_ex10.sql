SELECT 
	p1.name AS person_name1,
	p2.name AS person_name2,
	p1.address AS common_address
FROM person p1
CROSS JOIN person p2
WHERE p1.address = p2.address AND p1.id > p2.id
ORDER BY person_name1, person_name2, common_address;