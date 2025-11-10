-- Delete all rows from all tables and reset primary key back to 1.

TRUNCATE TABLE measurements_1 RESTART IDENTITY CASCADE;
TRUNCATE TABLE measurements_2 RESTART IDENTITY CASCADE;
TRUNCATE TABLE measurements_4 RESTART IDENTITY CASCADE;
TRUNCATE TABLE measurements_8 RESTART IDENTITY CASCADE;
TRUNCATE TABLE collection_plans RESTART IDENTITY CASCADE;
TRUNCATE TABLE contexts RESTART IDENTITY CASCADE;
TRUNCATE TABLE products RESTART IDENTITY CASCADE;
TRUNCATE TABLE sources RESTART IDENTITY CASCADE;

-- INSERT sources Table
INSERT INTO sources (attributes, description)
values ('{"Fab": "Fab_1", "Area": "F1.A1", "Tool": "F1.A1.T1", "Chamber": "F1.A1.T1.C1"}'::jsonb, 'sources: F1.A1.T1.C1 Description....');

INSERT INTO sources (attributes, description)
values ('{"Fab": "Fab_1", "Area": "F1.A1", "Tool": "F1.A1.T1", "Chamber": "F1.A1.T1.C2"}'::jsonb, 'sources: F1.A1.T1.C2 Description....');

INSERT INTO sources (attributes, description)
values ('{"Fab": "Fab_1", "Area": "F1.A1", "Tool": "F1.A1.T2", "Chamber": "F1.A1.T2.C2"}'::jsonb, 'sources: F1.A1.T1.C1 Description....');

INSERT INTO sources (attributes, description)
values ('{"Fab": "Fab_1", "Area": "F1.A2", "Tool": "F1.A2.T1", "Chamber": "F1.A2.T1.C1"}'::jsonb, 'sources: F1.A1.T1.C1 Description....');

INSERT INTO sources (attributes, description)
values ('{"Fab": "Fab_2", "Area": "F2.A1", "Tool": "F2.A1.T1", "Chamber": "F2.A1.T1.C1"}'::jsonb, 'sources: F1.A1.T1.C1 Description....');

INSERT INTO sources (attributes, description)
values ('{"Fab": "Fab_2", "Area": "F2.A2", "Tool": "F2.A2.T1", "Chamber": "F2.A2.T1.C1"}'::jsonb, 'sources: F1.A1.T1.C1 Description....');

INSERT INTO sources (attributes, description)
values ('{"Fab": "Fab_2", "Area": "F2.A2", "Tool": "F2.A2.T2", "Chamber": "F2.A2.T2.C1"}'::jsonb, 'sources: F1.A1.T1.C1 Description....');

INSERT INTO sources (attributes, description)
values ('{"Fab": "Fab_2", "Area": "F2.A2", "Tool": "F2.A2.T2", "Chamber": "F2.A2.T2.C2"}'::jsonb, 'sources: F1.A1.T1.C1 Description....');
-- SELECT * FROM sources;

-- INSERT PRODUCTS TABLE
INSERT INTO products (attributes, description)
values ('{"Lot": "Lot_1", "Slot": "L1.S1", "Wafer": "L1.S1.W1"}'::jsonb,	'products: L1.S1.W1 Description....');

INSERT INTO products (attributes, description)
values ('{"Lot": "Lot_1", "Slot": "L1.S1", "Wafer": "L1.S1.W2"}'::jsonb,	'products: L1.S1.W2 Description....');

INSERT INTO products (attributes, description)
values ('{"Lot": "Lot_1", "Slot": "L1.S2", "Wafer": "L1.S2.W1"}'::jsonb,	'products: L1.S2.W1 Description....');

INSERT INTO products (attributes, description)
values ('{"Lot": "Lot_1", "Slot": "L1.S2", "Wafer": "L1.S2.W2"}'::jsonb,	'products: L1.S2.W2 Description....');

INSERT INTO products (attributes, description)
values ('{"Lot": "Lot_2", "Slot": "L2.S1", "Wafer": "L2.S1.W1"}'::jsonb,	'products: L2.S1.W1 Description....');

INSERT INTO products (attributes, description)
values ('{"Lot": "Lot_2", "Slot": "L2.S2", "Wafer": "L2.S2.W2"}'::jsonb,	'products: L2.S2.W2 Description....');
-- SELECT * FROM products;

-- INSERT COLLECTION_PLANS TABLE
INSERT INTO collection_plans (svids, description)
VALUES('[
	   	 {"table_1": {"col_1": "CP1.T1.C1"}}
	    ]', 'Collection_Plans: CP1.T1 Description');

INSERT INTO collection_plans (svids, description)
VALUES('[
	     {"table_2": {"col_1": "CP2.T2.C1", "col_2": "CP2.T2.C2"}}
	    ]', 'Collection_Plans: CP2.T2 Description');	

INSERT INTO collection_plans (svids, description)
VALUES('[
	   	 {"table_1": {"col_1": "CP3.T1.C1"}},
	     {"table_2": {"col_1": "CP3.T2.C1", "col_2": "CP3.T2.C2"}}
	    ]', 'Collection_Plans: CP3.T1.T2 Description');			
		
INSERT INTO collection_plans (svids, description)
VALUES('[
	     {"table_4": {"col_1": "CP4.T4.C1", "col_2": "CP4.T4.C2", "col_3": "CP4.T4,C3", "col_4": "CP4.T4.C4"}}
	    ]', 'Collection_Plans: CP4.T4 Description');		
		
INSERT INTO collection_plans (svids, description)
VALUES('[
	     {"table_1": {"col_1": "CP5.T1.C1"}},
	     {"table_4": {"col_1": "CP5.T4.C1", "col_2": "CP5.T4.C2", "col_3": "CP5.T4,C3", "col_4": "CP5.T4.C4"}}
	    ]',  'Collection_Plans: CP5.T1.T4 Description');	
	   
INSERT INTO collection_plans (svids, description)
VALUES('[
	     {"table_2": {"col_1": "CP6.T2.C1", "col_2": "CP6.T2.C2"}},
	     {"table_4": {"col_1": "CP6.T4.C1", "col_2": "CP6.T4.C2", "col_3": "CP6.T4,C3", "col_4": "CP6.T4.C4"}}
	    ]', 'Collection_Plans: CP6.T2.T4 Description');	
		
INSERT INTO collection_plans (svids, description)
VALUES('[
	     {"table_1": {"col_1": "CP7.T1.C1"}},
	     {"table_2": {"col_1": "CP7.T2.C1", "col_2": "CP7.T2.C2"}},
	     {"table_4": {"col_1": "CP7.T4.C1", "col_2": "CP7.T4.C2", "col_3": "CP7.T4,C3", "col_4": "CP7.T4.C4"}}
	    ]', 'Collection_Plans: CP7.T1.T2.T4 Description');		
				
		
INSERT INTO collection_plans (svids, description)
VALUES('[
	     {"table_8": {"col_1": "CP8.T8.C1", "col_2": "CP8.T8.C2", "col_3": "CP8.T8,C3", "col_4": "CP8.T8.C4",
	   				  "col_5": "CP8.T8.C5", "col_2": "CP8.T8.C6", "col_3": "CP8.T8,C7", "col_4": "CP8.T8.C8"}
	     }
	    ]', 'Collection_Plans: CP8.T8 Description');		

-- SELECT * FROM collection_plans;

-- SELECT * FROM measurements_1;


