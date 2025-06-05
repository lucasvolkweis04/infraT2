-- Para realização dessa etapa, utilizei o DATASTAX como instância do Cassandra, ou seja comandos CQL.

--Keyspace do Q1 - Q2;
CREATE KEYSPACE "flight_schedule_keyspace" WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 } AND DURABLE_WRITES = false; USE "flight_schedule_keyspace";
CREATE TABLE flight_schedule_keyspace.flights_by_airport_by_date ( airport_id int,
departure_date text,
flight_id int,
airline_id int,
airplane_id int,
arrival text,
PRIMARY KEY (airport_id, departure_date, flight_id)
) WITH CLUSTERING ORDER BY (departure_date ASC, flight_id ASC);
CREATE TABLE flight_schedule_keyspace.flight_details ( flight_id int,
capacity int,
airplane_type_id int,
PRIMARY KEY (flight_id) );

----------
--Keyspace do Q3 - Q4;
CREATE KEYSPACE "booking_passenger_keyspace" WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 } AND DURABLE_WRITES = false; USE "booking_passenger_keyspace";
CREATE TABLE booking_passenger_keyspace.passengers_by_flightbooking ( flight_id int,
booking_id int,
passenger_id int,
seat text,
price decimal,
PRIMARY KEY (flight_id, booking_id, passenger_id)
) WITH CLUSTERING ORDER BY (booking_id ASC, passenger_id ASC);
 CREATE TABLE booking_passenger_keyspace.passenger_details ( passenger_id int,
birthdate date,
sex text,
country text, email text, telephone text, street text,
city text,
zip text,
PRIMARY KEY (passenger_id)
);

----------
--Keyspace do Q5 - Q6;
CREATE KEYSPACE "flight_departure_keyspace" WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 } AND DURABLE_WRITES = false; USE "flight_departure_keyspace";
CREATE TABLE flight_departure_keyspace.flight_by_departure_by_schedule ( airport_id int,
departure_date timestamp,
flight_id int,
airline_id int,
airplane_id int,
arrival timestamp,
PRIMARY KEY (airport_id, flight_id)
) WITH CLUSTERING ORDER BY (flight_id ASC);
CREATE TABLE flight_departure_keyspace.booking_status ( booking_id int,
passenger_id int,
price decimal,
seat text,
PRIMARY KEY (booking_id, passenger_id)
) WITH CLUSTERING ORDER BY (passenger_id ASC);

----------
--Keyspace do Q7 - Q8;
CREATE KEYSPACE airport_traffic_keyspace
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};
CREATE TABLE airport_traffic_keyspace.flights_by_destination_city ( airport_id int,
city text,
country text,
latitude double,
longitude double, PRIMARY KEY (airport_id)
);
CREATE TABLE airport_traffic_keyspace.airplane_capacity_by_destination_city ( airport_id int,
name text,
country text,
total_passengers int,
PRIMARY KEY (airport_id) );