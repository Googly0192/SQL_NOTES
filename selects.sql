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
	CALL add_measurements(5, '{1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1, 10.1, 11.1, 12.1, 13.1, 14.1, 15.1}'::REAL[], mId);
	RAISE INFO  'collection_plan_id: %', mId;					 
END $$;
SELECT * FROM measurements_1;
SELECT * FROM measurements_2;
SELECT * FROM measurements_4;
SELECT * FROM collection_plans WHERE cp_name = 'Collection_Plan_5';


DO $$
DECLARE 
 t VARCHAR(100);
 c VARCHAR(100);
Begin
	SELECT tableName, colName INTO t, c FROM get_svid_column('CP5.T4.C2', 'Collection_Plan_5');
	RAISE INFO  't: %, c: %', t, c;					 
END $$;

SELECT * 
FROM measurements_1 m1
INNER JOIN measurement_2 m2 ON m1.context_id = m2.context_id


SELECT * FROM get_svid_column('CP5.T4.C2', 'Collection_Plan_5');

SELECT * FROM get_measurement('CP5.T4.C2', 'Collection_Plan_5', '{"source":{"Chamber": "F1.A1.T2.C2"}, "product":{"Wafer": "L1.S2.W1"}}');

SELECT measurements_4.col_2, conxt.id context_id FROM contexts AS conxt  
INNER JOIN measurements_4 ON measurements_4.context_id = conxt.id;

SELECT table_4.col_2 conxt.id context_id
FROM contexts AS conxt  
INNER JOIN table_4 ON conxt.id = table_4.context_id;
						
SELECT * FROM collection_plans;
SELECT * FROM contexts;
SELECT * FROM measurements_1;
SELECT * FROM measurements_2;
SELECT * FROM measurements_4;
SELECT * FROM measurements_8;

INSERT INTO public.measurements_1 (context_id, measurement_time, col_1)
VALUES(5, Now(), 1.51);

INSERT INTO public.measurements_2 (context_id, measurement_time, col_1, col_2)
VALUES(5, Now(), 2.51, 2.52);

INSERT INTO public.measurements_4 (context_id, measurement_time, col_1, col_2, col_3, col_4)
VALUES(5, Now(), 4.51, 4.52, 4.53, 4.54);

INSERT INTO public.measurements_8 (context_id, measurement_time, col_1, col_2, col_3, col_4, col_5, col_6, col_7, col_8)
VALUES(5, Now(), 8.51, 8.52, 8.53, 8.54, 8.55, 8.56, 8.57, 8.58);


SELECT * FROM get_where_clause('source', '{"Fab":{"comparator":"=", "val":"Fab_1"}, "Tool":{"comparator":"=", "val":"F1.A1.T2"}, "Chamber":{"comparator":"LIKE", "val":"F1.A1.T2.C2"}}');
SELECT * FROM get_where_clause('product', '{"wafer_id":{"comparator":"=", "val":"Wafer_123"}, "lot_id":{"comparator":"LIKE", "val":"Lot_abc"}}');

SELECT * FROM get_measurement('CP5T4C3', 'Collection_Plan_5', '{"source": {"Fab":{"comparator":"=", "val":"Fab_1"}, "Tool":{"comparator":"=", "val":"F1.A1.T2"}}, "product":{"Lot":{"comparator":"=", "val":"Lot_1"}}}');

--select '{"source":{"Chamber": "F1.A1.T2.C2"}, "product":{"Wafer": "L1.S2.W1"}}'::JSONB->>'source'
-- select '{"source": {"Fab":{"comparator":"=", "val":"Fab_1"}, "Tool":{"comparator":"=", "val":"F1.A1.T2"}}, "product":{"Chamber":{"comparator":"LIKE", "val":"F1.A1.T2.C2"}}}'::JSONB->'source';

SELECT measurements_1.col_1 AS CP5T1C1, measurements_1.id AS measurement_id, measurements_1.measurement_time , conxt.id context_id 
FROM contexts AS conxt  
INNER JOIN measurements_1 ON measurements_1.context_id = conxt.id  
INNER JOIN products ON conxt.product_id = products.id 
INNER JOIN sources  ON conxt.source_id = sources.id 
WHERE  (sources.attributes->>'Fab' = 'Fab_1'  AND sources.attributes->>'Tool' = 'F1.A1.T2' )  
AND  (products.attributes->>'Chamber' LIKE 'F1.A1.T2.C2' ) 




