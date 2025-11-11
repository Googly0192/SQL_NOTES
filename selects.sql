select * from collection_plans;
select * from sources;
select * from products;
select * from contexts;

select attributes->>'WaferId' from products;
--select m1.col_1, m2.col_1, m2.col_2, m4.col_1, m4.col_2, m4.col_3, m4.col_4 from measurements_1 AS m1 
--	INNER JOIN measurements_2 AS m2 ON m1.context_id = m2.context_id
--	INNER JOIN measurements_4 AS m4 ON m2.context_id = m4.context_id
--	WHERE m1.context_id = 1

select conxt.id as cnxt_id, prod.id as prod_id, prod.attributes, s.attributes from contexts AS conxt
	INNER JOIN products AS prod ON conxt.product_id = prod.id
	INNER JOIN sources AS s ON conxt.source_id = s.id
	WHERE prod.attributes->>'WaferId' LIKE 'Wafer_%'
		  AND prod.attributes->>'Family' LIKE 'I%'
		  AND prod.attributes->>'LotId' = 'Lot_ABC'
		  AND s.attributes->>'Chamber' = '1B'

DO $$
DECLARE 
new_id INTEGER;
Begin
	CALL add_sources('{"Fab": "New Fab 2", "Area": "F1.A1", "Tool": "F1.A1.T1", "Chamber": "F1.A1.T1.C1"}'::jsonb,
					 'New Description', new_id);
	RAISE INFO  'New ID: %', new_id;					 
END $$;

SELECT * FROM public.get_all_sources();
SELECT * FROM public.get_all_products();
SELECT * FROM public.get_all_contexts();
