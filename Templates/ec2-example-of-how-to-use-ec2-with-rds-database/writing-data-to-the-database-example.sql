CREATE TABLE example_table (
	id serial PRIMARY KEY,
	person_name VARCHAR ( 50 ) NOT NULL,
    gender VARCHAR ( 10 ) NOT NULL
);

INSERT INTO
    example_table(person_name,gender)
VALUES    
    ('James','Male'),
    ('Robert','Male'),
    ('John','Male'),
    ('Michael','Male'),
    ('David','Male'),
    ('William','Male'),
    ('Mary','Female'),
    ('Patricia','Female'),
    ('Jennifer','Female'),
    ('Linda','Female'),
    ('Elizabeth','Female');

        