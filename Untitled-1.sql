
DROP PROCEDURE public."GetAll"(OUT sources refcursor);
DROP PROCEDURE public."GetMeasurements"();
DROP FUNCTION public.get_all(sourceid     INT)
DROP PROCEDURE public.setx();
DROP FUNCTION public.get_all_sources();
DROP FUNCTION public.get_all_products();
DROP FUNCTION public.get_all_contexts();
DROP PROCEDURE public.add_source(IN attributes jsonb, IN descrip VARCHAR(1000), OUT source_id INTEGER);
DROP PROCEDURE public.add_product( IN attributes jsonb, IN descrip VARCHAR(1000), OUT product_id INTEGER);
DROP PROCEDURE public.add_collection_plan( IN svids jsonb, IN cpname VARCHAR(100), IN descrip VARCHAR(1000), OUT collection_plan_id INTEGER);
DROP PROCEDURE public.add_context( IN sourceId INTEGER, IN productId INTEGER, IN collection_planId INTEGER, OUT context_id INTEGER);
DROP PROCEDURE public.add_measurements( IN contextId INTEGER, IN measurements REAL[], OUT success BOOLEAN);
DROP PROCEDURE public.get_collection_plan_id( IN  collection_plan_name VARCHAR(100), OUT collection_plan_id INTEGER);
DROP FUNCTION public.get_measurement(svid_name   VARCHAR(100), collection_plan_name VARCHAR(100), cnxt jsonb);
DROP FUNCTION public.get_svid_column( svid_name VARCHAR(100), collection_plan_name VARCHAR(100));

DROP TABLE IF EXISTS public.measurements_1;
DROP TABLE IF EXISTS public.measurements_2;
DROP TABLE IF EXISTS public.measurements_4;
DROP TABLE IF EXISTS public.measurements_8
DROP TABLE IF EXISTS public.contexts;
DROP TABLE IF EXISTS public.products;
DROP TABLE IF EXISTS public.sources;
DROP TABLE IF EXISTS public.collection_plans;




DECLARE
    dynamic_query TEXT;
	src TEXT;
	svid_names jsonb;
    t TEXT;
    svidsj TEXT;
	c TEXT;
	svid TEXT;
	matchFound BOOLEAN DEFAULT FALSE;
BEGIN
    RAISE INFO 'svid_name:%', svid_name;
    RAISE INFO 'collection_plan_name: %', collection_plan_name;
    RAISE INFO 'context: %', cnxt;
	
	------------
	SELECT svids INTO svid_names::jsonb FROM collection_plans WHERE cp_name = collection_plan_name;
    RAISE INFO 'svid_names: %', svid_names;
	
	
	FOR t, svidsj IN SELECT * FROM jsonb_each_text(svid_names) LOOP
		FOR c, svid IN SELECT * FROM jsonb_each_text(svidsj::JSONB) LOOP
			RAISE INFO 'Search: %, t: %, c: %, svid: %', svid_name, t, c, svid;
    		IF svid = svid_name THEN
				matchFound := TRUE;
				EXIT;
			END IF;
		END LOOP;
		EXIT WHEN matchFound = TRUE;
	END LOOP;

SELECT * FROM get_measurement('CP5T1C1', 'Collection_Plan_5', '{"source":{"Chamber": "F1.A1.T2.C2"}, "product":{"Wafer": "L1.S2.W1"}}');

SELECT measurements_4.col_2 AS CP5T1C1, measurements_4.id AS measurement_id, measurements_4.measurement_time , conxt.id context_id 
FROM contexts AS conxt  INNER JOIN measurements_4 ON measurements_4.context_id = conxt.id  
INNER JOIN products ON conxt.product_id = products.id INNER JOIN sources  ON conxt.source_id = sources.id 
WHERE  (sources.attributes->>'Fab' = 'Fab_1'  AND sources.attributes->>'Tool' = 'F1.A1.T2'  AND sources.attributes->>'Chamber' LIKE 'F1.A1.T2.C2' )  
AND  (products.attributes->>'lot_id' LIKE 'Lot_abc'  AND products.attributes->>'wafer_id' = 'Wafer_123' ) 



    RETURN QUERY SELECT * FROM sources;
	dynamic_query := format('SELECT %s, conxt.id cnxt_id, prod.id prod_id, prod.attributes Product, s.attributes Source from contexts AS conxt
	INNER JOIN products AS prod ON conxt.product_id = prod.id
	INNER JOIN sources AS s ON conxt.source_id = s.id	
	INNER JOIN %s m ON conxt.id = m.context_id
	WHERE ', src);
    RAISE NOTICE 'Formatted: %', dynamic_query;

    --dynamic_query := format('SELECT id, context_id, measurement_time, %s AS svid FROM %s WHERE context_id = %s',
    --                        col_name, table_name, cnxt_id);
    --RAISE NOTICE 'Formatted: %', dynamic_query;
    --RETURN QUERY EXECUTE dynamic_query;
	
	src := 'SELECT %s, conxt.id cnxt_id, prod.id prod_id, prod.attributes Product, s.attributes Source from contexts AS conxt
	INNER JOIN products AS prod ON conxt.product_id = prod.id
	INNER JOIN sources AS s ON conxt.source_id = s.id	
	INNER JOIN measurements_1 m1 ON conxt.id = m1.context_id
	WHERE ';
END;


'"source": {"Fab":{"comparator":"=", "val":"Fab_1"}, "Tool":{"comparator":"=", "val":"F1.A1.T2"}},
"product":{"Chamber":{"comparator":"LIKE", "val":"F1.A1.T2.C2"}}'