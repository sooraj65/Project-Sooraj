---1 Database creation
create database eventsmanagement;

create table Events(
event_id serial primary key,
event_name varchar(255),
event_date date,
event_location varchar(255),
event_description TEXT
);
create table Attendees(
Attendee_id serial primary key,
Attendee_name Varchar(255),
Attendee_phone Varchar(15),
Attendee_email varchar(255),
Attendee_city Varchar(255)
);
Create table Registrations(
Registration_id serial primary key,
Event_id int references Events(event_id),
Attendee_id int references Attendees(Attendee_id),
Registration_date Date,
Registration_amount Decimal(10,2)
);

---2 data creation
-- Insert data into the events table
INSERT INTO events (event_name, event_date, event_location, event_description)
VALUES
    ('Conference 2023', '2023-11-15', 'Convention Center', 'Annual tech conference'),
    ('Music Festival', '2023-08-20', 'City Park', 'Live music and food festival');

-- Insert data into the attendees table
INSERT INTO attendees (attendee_name, attendee_phone, attendee_email, attendee_city)
VALUES
    ('John Doe', '123-456-7890', 'john.doe@email.com', 'New York'),
    ('Alice Smith', '987-654-3210', 'alice.smith@email.com', 'Los Angeles');

-- Insert data into the registrations table
INSERT INTO registrations (event_id, attendee_id, registration_date, registration_amount)
VALUES
    (1, 1, '2023-10-05', 100.00),
    (1, 2, '2023-10-10', 100.00),
    (2, 1, '2023-07-25', 75.00);
	
---3 Manage event details

---a -new event inserting
INSERT INTO events (event_name, event_date, event_location, event_description)
VALUES
    ('New Event', '2023-12-31', 'New Location', 'Description of the new event');

--- b updating event information
UPDATE events
SET event_description = 'Updated event description'
WHERE event_id = 1;	

---c deleting an event
--- because of foregin key constraint deleting first value from registrations table
DELETE FROM registrations
WHERE event_id = 2;
DELETE FROM events
WHERE event_id = 2;

---4 Manage track attendee & handle events

   --a new attendee
INSERT INTO attendees (attendee_name, attendee_phone, attendee_email, attendee_city)
VALUES
    ('New Attendee', '123-456-7890', 'new.attendee@email.com', 'City Name');

--- b registering attendee for an event
INSERT INTO registrations (event_id, attendee_id, registration_date, registration_amount)
VALUES
    (3, 3, '2023-10-15', 50.00);
	
--- 5 Develop queries to retrieve event information, generate attendee list and calculate event attendee statistics

---event information
Select * from events;

---generate attendee list for a specific event

SELECT a.attendee_name, a.attendee_phone, a.attendee_email, a.attendee_city
FROM attendees a
JOIN registrations r ON a.attendee_id = r.attendee_id
WHERE r.event_id = 1;

---calculate the event attendance statistics
select count(*) as total_attendees
from registrations
where event_id = 3;
