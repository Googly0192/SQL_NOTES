-- PROCEDURE: public.GetAll()

DROP PROCEDURE IF EXISTS public."GetMeasurements"();

CREATE OR REPLACE PROCEDURE public."GetMeasurements"(
	)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN
	select * from table_1;    
END;
$BODY$;
ALTER PROCEDURE public."GetMeasurements"()
    OWNER TO postgres;

--------------


CREATE OR REPLACE FUNCTION get_measurements(col_name VARCHAR(10), table_name VARCHAR(20),cnxt_id BIGINT)
RETURNS TABLE (
	id				INT,
    context_id 		 INT,
    measurement_time TIMESTAMPTZ,
    svid 			 REAL
)
LANGUAGE plpgsql
AS $$
DECLARE
    dynamic_query TEXT;
BEGIN
    --RETURN QUERY SELECT context_id,  FROM sources where sources.id > context_id ;
	dynamic_query := format('SELECT id, context_id, measurement_time, %s AS svid FROM %s WHERE context_id = %s',
							col_name, table_name, cnxt_id);
	RAISE NOTICE 'Formatted: %', dynamic_query;
    RETURN QUERY EXECUTE dynamic_query;
END;
$$ 
--SELECT * FROM get_measurements('col_1', 'measurements_2', 2);



