-- insertions
INSERT INTO sources (attributes, description)
values ('{"Fab": "Aloha", "Area": "Etch", "Tool": "Endura_987", "Degas": "1B"}'::jsonb,
   			'source description....');

INSERT INTO products (attributes, description)
values ('{"Type": "Logic", "Family": "I9"}'::jsonb,	'Product description....');

INSERT INTO contexts (source_id, product_id, collection_plan_id)
values (10,1,15);

INSERT INTO measurements_1 (context_id, measurement_time, col_1)
values (1,NOW(),11.11);

INSERT INTO measurements_2 (context_id, measurement_time, col_1, col_2)
values (2,NOW(),2.115, 2.2215);

INSERT INTO measurements_4 (context_id, measurement_time, col_1, col_2, col_3, col_4)
values (2,NOW(),4.115, 4.215, 4.315, 4.415);

INSERT INTO measurements_8 (context_id, measurement_time, col_1, col_2, col_3, col_4, col_5, col_6, col_7, col_8)
values (1,NOW(),8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8);
			
select * from sources;
select * from products;
select * from collection_plans;
select * from contexts;
select * from measurements_1;
select * from measurements_2;
select * from measurements_4;
select * from measurements_8;

select m1.col_1, m2.col_1, m2.col_2, m4.col_1, m4.col_2, m4.col_3, m4.col_4 from measurements_1 AS m1 
	INNER JOIN measurements_2 AS m2 ON m1.context_id = m2.context_id
	INNER JOIN measurements_4 AS m4 ON m2.context_id = m4.context_id
	WHERE m1.context_id = 1
	
SELECT * FROM get_measurements(10);
