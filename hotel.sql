DROP TABLE IF EXISTS hotel CASCADE;
DROP TABLE IF EXISTS address CASCADE;
DROP TABLE IF EXISTS phone_number CASCADE;
create type identification as enum('passport', 'driving license');
create table hotel(
	id serial,
	name varchar(30),
	primary key(id)
);

create table address(
	id int references hotel,
	country varchar(30),
	city varchar(30),
	street varchar(30),
	building varchar(30),
	primary key(id)

);

create table phone_number(
	number_id varchar(30),
	id int references hotel,
	primary key (number_id)
);

create table hotel_feature(
	id int references hotel,
	service varchar(30),
	primary key (id, service)
);

create table hotel_room_type(
	type_id serial,
	id int references hotel,
	name varchar(30),
	type_size int,
	capacity int,
	primary key(type_id)
);

create table room(
	room_id serial,
	id int references hotel,
	room_number varchar(30),
	room_floor int,
	room_type int references hotel_room_type,
	primary key(room_id)
);

create table guest(
	id serial,
	identification_type identification,
	identification_number int,
	mobile_phone varchar(30),
	home_phone varchar(30),
	address varchar(30),
	primary key(id)
); 

create table reservations(
	id serial,
	guest_id int references guest,
	type_id int references hotel_room_type,
	check_in date,
	check_out date,
	primary key(id)
);


create table occupaition(
	rsvsn_id int references reservations,
	room_id int references room,
        guest_id int references guest,
	primary key(rsvsn_id)
);



--select rvs.guest
--	from 
--		occupation occ,
--		reservation rvs,
--		where occ.rvsn_id = rvs.id;

create table price(
	day int,
	room_type int references hotel_room_type, 	
	price float,
	check(1 <= day and day <=7),
	primary key(day, room_type)
)


create table bill_history(
  bill_id serial,
  rsvsn_id int references reservation,
  guest_id int references guest,
  primary key(bill_id) 
)

create table employee(
  employee_id int,
  primary key(employee_id)
)

create table manager(
  employee_id int references employee,
  primary key(employee_id)
)



