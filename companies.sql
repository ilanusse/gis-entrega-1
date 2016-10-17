DROP TABLE companies;
CREATE TABLE companies (ogc_fid serial NOT NULL, name varchar(100), origin varchar(100), sector varchar(100), status varchar(100), address varchar(100), address2 varchar(100));
SELECT AddGeometryColumn('companies', 'geometry', 4326, 'POINT', 3);
