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