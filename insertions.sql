--CQL para inserção de dados.

--Q1 -
SELECT DISTINCT
'insert into flights_by_airport_by_date (airport_id, departure_date, flight_id, airline_id, airplane_id, arrival) values (' ||
fs.from_airport_id || ',' ||
'''' || TO_CHAR(f.departure, 'yyyy-mm-dd hh24:mi:ss') || ''',' ||
f.flight_id || ',' ||
f.airline_id || ',' ||
f.airplane_id || ',' ||
'''' || TO_CHAR(f.arrival, 'yyyy-mm-dd hh24:mi:ss') || ''');'
FROM
air_flights_schedules fs
INNER JOIN air_flights f ON f.flightno = fs.flightno;

--Q2-
SELECT DISTINCT 'insert into flight_details (flight_id, capacity, airplane_type_id) values (' || f.flight_id || ',' ||
a.capacity || ',' ||
a.airplane_type_id || ');' FROM AIR_FLIGHTS f
JOIN AIR_AIRPLANES a ON f.AIRPLANE_ID = a.AIRPLANE_ID WHERE f.FLIGHT_ID = 143083;
insert into flight_details (flight_id, capacity, airplane_type_id) values (143083,644,6);

--Q3 -
SELECT DISTINCT
'insert into passengers_by_flightbooking (flight_id, booking_id, passenger_id, seat, price) values (' ||
f.flight_id || ',' ||
b.booking_id || ',' ||
p.passenger_id || ',' ||
 '''' || TRIM(b.seat) || ''',' || b.price || ');'
FROM
air_flights f
INNER JOIN air_bookings b ON b.flight_id = f.flight_id
INNER JOIN air_passengers p ON p.passenger_id = b.passenger_id;

--Q4 -
SELECT DISTINCT
'insert into passenger_details (passenger_id, birthdate, sex, country, email, telephone, street, city, zip) values (' ||
ps.passenger_id || ',' ||
'''' || TO_CHAR(ps.birthdate, 'yyyy-mm-dd') || ''',' ||
'''' || ps.sex || ''',' ||
'''' || ps.country || ''',' ||
'''' || ps.emailaddress || ''',' ||
'''' || ps.telephoneno || ''',' ||
'''' || ps.street || ''',' ||
'''' || ps.city || ''',' ||
'''' || ps.zip || ''');'
FROM
air_passengers_details ps;

--Q5 -
SELECT DISTINCT
'insert into flight_by_departure_by_schedule (airport_id, departure_date, flight_id, airline_id, airplane_id, arrival) values (' ||
fs.from_airport_id || ',' ||
'''' || TO_CHAR(f.departure, 'yyyy-mm-dd hh24:mi:ss') || ''',' ||
f.flight_id || ',' ||
f.airline_id || ',' ||

 f.airplane_id || ',' ||
'''' || TO_CHAR(f.arrival, 'yyyy-mm-dd hh24:mi:ss') || ''');' FROM
air_flights_schedules fs
INNER JOIN air_flights f ON f.flightno = fs.flightno;

--Q6 -
SELECT DISTINCT 'insert into booking_status (booking_id, price, seat, passenger_id) values (' ||
b.booking_id || ',' || b.price || ',' ||
'''' || b.seat || ''',' || p.passenger_id || ');'
FROM AIR_BOOKINGS b
JOIN AIR_PASSENGERS p ON b.PASSENGER_ID = p.PASSENGER_ID WHERE b.BOOKING_ID = 181999;
insert into booking_status (booking_id, price, seat, passenger_id) values (181999,500,97,'22E ',27869);

--Q7 -
SELECT DISTINCT 'insert into flights_by_destination_city (airport_id, city, country, latitude, longitude) values (' ||
ag.airport_id || ',' ||
'''' || ag.city || ''',' ||
'''' || ag.country || ''',' || ag.latitude || ',' || ag.longitude || ');'
FROM AIR_AIRPORTS_GEO ag WHERE ag.AIRPORT_ID = 9124;
insert into flights_by_destination_city (airport_id, city, country, latitude, longitude) values (9124, 'OTTAWA', 'UNITED STATES', 38.538611, -95.253056);

--Q8 -
SELECT DISTINCT
'insert into airplane_capacity_by_destination_city (airport_id, name, country,
total_passengers) values (' ||
ag.airport_id || ',' ||
'''' || a.name || ''',' || -- Nome do aeroporto
'''' || ag.country || ''',' ||
(SELECT NVL(SUM(ap.capacity), 0) -- Soma da capacidade dos aviões para os voos
que chegam a este aeroporto
FROM air_flights f
JOIN air_airplanes ap ON f.airplane_id = ap.airplane_id
WHERE f.to_airport_id = ag.airport_id
AND TO_CHAR(f.arrival, 'YYYY-MM-DD') = '2023-05-18') || -- A data específica (ajuste
conforme necessário) ');'
FROM AIR_AIRPORTS_GEO ag
JOIN AIR_AIRPORTS a ON ag.airport_id = a.airport_id WHERE ag.airport_id = 509;
insert into airplane_capacity_by_destination_city (airport_id, name, country, total_passengers) values (509,'ARBRA','SWEDEN',593);