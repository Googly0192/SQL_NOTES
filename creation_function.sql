CREATE OR REPLACE FUNCTION get_measurements(col_name VARCHAR(10), table_name VARCHAR(20),cnxt_id BIGINT)
RETURNS TABLE (
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
	dynamic_query := format('SELECT context_id, measurement_time, %s AS svid FROM %s WHERE context_id = %s',
							col_name, table_name, cnxt_id);
	RAISE NOTICE 'Formatted: %', dynamic_query;
    RETURN QUERY EXECUTE dynamic_query;
END;
$$ 
--######################

DO $$
DECLARE
    my_array_variable TEXT[]; -- Declare an array variable
	tbl_name TEXT;
BEGIN
    my_array_variable := ARRAY(select jsonb_object_keys(svids) from collection_plans where id = 14);

    RAISE NOTICE 'array_length: %', array_length(my_array_variable, 1);
	--RETURN QUERY
	--select * from table_1;
	
	FOREACH tbl_name IN ARRAY my_array_variable LOOP
        -- Perform an action with the current element
        RAISE NOTICE 'Current element: %', tbl_name;
    END LOOP;
	
END $$;

--SELECT * FROM get_measurements(10);