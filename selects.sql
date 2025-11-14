select * from collection_plans;
select * from sources;
select * from products;
select * from contexts;

select attributes->>'WaferId' from products;
--select m1.col_1, m2.col_1, m2.col_2, m4.col_1, m4.col_2, m4.col_3, m4.col_4 from measurements_1 AS m1 
--	INNER JOIN measurements_2 AS m2 ON m1.context_id = m2.context_id
--	INNER JOIN measurements_4 AS m4 ON m2.context_id = m4.context_id
--	WHERE m1.context_id = 1

select m1.col_1, conxt.id cnxt_id, prod.id prod_id, prod.attributes Product, s.attributes Source from contexts AS conxt
	INNER JOIN products AS prod ON conxt.product_id = prod.id
	INNER JOIN sources AS s ON conxt.source_id = s.id	
	INNER JOIN measurements_1 m1 ON conxt.id = m1.context_id
	WHERE prod.attributes->>'Lot' = 'Lot_1'
		  AND prod.attributes->>'Slot' = 'L1.S2'
		  AND prod.attributes->>'Wafer' = 'L1.S2.W1'
		  AND s.attributes->>'Chamber' = 'F1.A1.T2.C2'

DO $$
DECLARE 
new_id INTEGER;
Begin
	CALL add_source('{"Fab": "New Fab 2", "Area": "F1.A1", "Tool": "F1.A1.T1", "Chamber": "F1.A1.T1.C1"}'::jsonb,
					 'New Description', new_id);
	RAISE INFO  'New ID: %', new_id;					 
END $$;
SELECT * FROM public.get_all_sources();


DO $$
DECLARE 
new_id INTEGER;
Begin
	CALL add_product('{"Lot": "Lot AI", "Slot": "Slot_A", "Wafer": "Wafer A"}'::jsonb,
					 'New Description', new_id);
	RAISE INFO  'New ID: %', new_id;					 
END $$;
SELECT * FROM public.get_all_products();


DO $$
DECLARE 
new_id INTEGER;
Begin
	CALL add_collection_plan('[{"table_1":{"col_1":"123"}},{"table_2":{"col_1":"gfgf", "col_2": "trtrt"}}]'::jsonb,
					 'Newly_Added_2', 'New Description', new_id);
	RAISE INFO  'New ID: %', new_id;					 
END $$;
SELECT * FROM collection_plans;


DO $$
DECLARE 
new_id INTEGER;
Begin
	CALL add_context(3,2,4, new_id);
	RAISE INFO  'New ID: %', new_id;					 
END $$;
SELECT * FROM public.get_all_contexts();


DO $$
DECLARE 
cp_id INTEGER;
Begin
	CALL get_collection_plan_id('Collection_Plan_88', cp_id);
	RAISE INFO  'collection_plan_id: %', cp_id;					 
END $$;


SELECT * FROM measurements_1;

DO $$
DECLARE 
len INTEGER;
Begin
	SELECT array_length(ARRAY[1, 2, 3, 4, 5], 1) INTO len;
	RAISE INFO  'Array Length: %', len;					 
END $$;


DO $$
DECLARE 
mId BOOLEAN;
Begin
	CALL add_measurements(7, '{1.1, 2.1, 3.1, 4.1, 5.1}'::REAL[], mId);
	RAISE INFO  'collection_plan_id: %', mId;					 
END $$;
SELECT * FROM measurements_1;
SELECT * FROM measurements_2;
SELECT * FROM measurements_4;
SELECT * FROM collection_plans WHERE cp_name = 'Collection_Plan_3';


SELECT * 
FROM measurements_1 m1
INNER JOIN measurement_2 m2 ON m1.context_id = m2.context_id


SELECT * FROM get_svid_column('CP5.T4.C9', 'Collection_Plan_5');

SELECT * FROM get_measurement('CP7.T2.C1', 'Collection_Plan_9', '{"source":{"Chamber": "F1.A1.T2.C2"}, "product":{"Wafer": "L1.S2.W1"}}');

SELECT * FROM collection_plans;
INSERT INTO collection_plans (svids, cp_name, description)
VALUES('{"table_1": {"col_1": "CP7.T2.C1"},"table_2": {"col_1": "CP7.T2.C1", "col_2": "CP7.T2.C2"}}',
	   'Collection_Plan_7', 'Collection_Plans: CP7.T1.T2.T4 Description');


