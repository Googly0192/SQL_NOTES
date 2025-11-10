CREATE TABLE meaurements_8 (
    id SERIAL PRIMARY KEY,
    context_id SERIAL,
    measurement_time TIMESTAMPTZ,
	col_1 real,
	col_2 real,
	col_3 real,
	col_4 real,
	col_5 real,
	col_6 real,
	col_7 real,
	col_8 real
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
	attributes jsonb,
	description VARCHAR(100)
);

CREATE TABLE contexts (
    id SERIAL PRIMARY KEY,
	source_id bigint,
	product_id bigint,
	collection_plan_id bigint
);

ALTER TABLE contexts
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES products (id)
ON DELETE SET NULL;


ALTER TABLE contexts
ADD CONSTRAINT fk_source
FOREIGN KEY (source_id)
REFERENCES sources (id)
ON DELETE SET NULL;

ALTER TABLE ONLY public.measurements_1
    ADD CONSTRAINT fk_context FOREIGN KEY (context_id) REFERENCES public.contexts(id) ON DELETE SET NULL;

ALTER TABLE ONLY public.measurements_2
    ADD CONSTRAINT fk_context FOREIGN KEY (context_id) REFERENCES public.contexts(id) ON DELETE SET NULL;
	
ALTER TABLE ONLY public.measurements_4
    ADD CONSTRAINT fk_context FOREIGN KEY (context_id) REFERENCES public.contexts(id) ON DELETE SET NULL;
	
ALTER TABLE ONLY public.measurements_8
    ADD CONSTRAINT fk_context FOREIGN KEY (context_id) REFERENCES public.contexts(id) ON DELETE SET NULL;
	
ALTER TABLE ONLY public.contexts
    ADD CONSTRAINT fk_collection_plan FOREIGN KEY (collection_plan_id) REFERENCES public.collection_plans(id) ON DELETE SET NULL;

	
--pg_dump -s -d ProcAI -f C:\Projects\Production_Code\database_schemaProcAI.sql;


