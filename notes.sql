--INSERT INTO source (name,description)
--values ('sensor_7', 'sensor_7 description');

--select * from source
--CALL public.SetX();

--SELECT * FROM get_all(1);

--select * from source


--SELECT proname, proargnames, proargtypes::regtype[] FROM pg_proc WHERE proname = 'GetAll';

INSERT INTO collection_plans (svids, description)
values ('{"col_1": "Oxygen", "col_2": "H2O", "col_3": "PhotoResist", "col_4": "Orgon"}'::jsonb,
   			'some description....');

INSERT INTO collection_plans (svids, description)
values ('{"col_1": "Oxygen", "col_2": "H2O", "col_3": "PhotoResist", "col_4": "Nitrogen"}'::jsonb,
   			'some description....');

INSERT INTO sources (svids, description)
values ('{col_1": "Oxygen", "col_2": "H2O", "col_3": "PhotoResist", "col_4": "Nitrogen"}'::jsonb,
   			'some description....');
			
		
SELECT * FROM collection_plan;
SELECT SVIDS FROM collection_plan where svids->>'col_4' = 'Nitrogen'
SELECT SVIDS->>'col_4' AS svid FROM collection_plan;
-- SVIDS from collection_plan

select * from sources
--delete from sources
--delete from products
--delete from context
--delete from collection_plans

INSERT INTO collection_plans (svids, description)
VALUES (
		'{"table_1":{"col_1": "Oxygen", "col_2": "H2O", "col_3": "PhotoResist", "col_4": "Nitrogen"},
		  "table_2":{"col_1": "Water", "col_2": "H2O", "col_3": "PhotoResist", "col_4": "Nitrogen"},
		  "table_6":{"col_1": "Helium", "col_2": "H2O", "col_3": "PhotoResist", "col_4": "Nitrogen"}
		 }'::jsonb,
	'some description....1'
);

INSERT INTO sources (attributes, description)
values ('{"Fab": "Fab20", "Area": "Etch", "Tool": "AMAT0234", "Chamber": "1B"}'::jsonb,
   			'source description....');
			
select * from sources;	
select * from products;
select * from context;
select * from public.collection_plans;
select * from measurements_2;

SELECT * FROM public.collection_plans
ORDER BY id ASC 
		
SELECT key, value FROM jsonb_each('{"a": 1, "b": "hello"}'::jsonb);	

select svids from collection_plans
select jsonb_object_keys(svids) from collection_plans where id = 15


SELECT id FROM collection_plans;
SELECT * FROM get_measurements('col_1', 'measurements_2', 2);
