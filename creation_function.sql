--SELECT id FROM collection_plans

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