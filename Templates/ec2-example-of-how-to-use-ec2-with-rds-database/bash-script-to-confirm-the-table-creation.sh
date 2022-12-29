export RDS_USERNAME=master
export PGPASSWORD=12345678
export RDS_ENDPOINT=example-postgres-instance.c4ypbbmbnnpb.us-east-1.rds.amazonaws.com
export DATABASE_NAME=example_database

psql "host=$RDS_ENDPOINT dbname=$DATABASE_NAME user=$RDS_USERNAME password=$PGPASSWORD"

select * from example_table;