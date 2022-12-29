export RDS_USERNAME=master
export PGPASSWORD=12345678
export RDS_ENDPOINT=example-postgres-instance.c4ypbbmbnnpb.us-east-1.rds.amazonaws.com
export DATABASE_NAME=example_database


# Creating table and inserting data to it
psql "host=$RDS_ENDPOINT dbname=$DATABASE_NAME user=$RDS_USERNAME password=$PGPASSWORD" -c "CREATE TABLE example_table (id serial PRIMARY KEY, person_name VARCHAR NOT NULL, gender VARCHAR ( 10 ) NOT NULL)"
psql "host=$RDS_ENDPOINT dbname=$DATABASE_NAME user=$RDS_USERNAME password=$PGPASSWORD" -c "INSERT INTO  example_table (person_name,gender) VALUES ('James','Male'), ('Robert','Male'), ('John','Male'), ('Michael','Male'), ('David','Male'), ('William','Male'), ('Mary','Female'), ('Patricia','Female'), ('Jennifer','Female'), ('Linda','Female'), ('Elizabeth','Female')"

# Verifying if it worked
psql "host=$RDS_ENDPOINT dbname=$DATABASE_NAME user=$RDS_USERNAME password=$PGPASSWORD"
select * from example_table;

# Table clean up

drop table example_table;