CREATE TABLE classRoom(
    number_of_seat int NOT NULL,
    floor int NOT NULL,
    class_room_number int PRIMARY KEY,
    class_room_type varchar(10) NOT NULL CHECK (class_room_type IN ('A/C', 'NON A/C'))
);

insert into classroom(number_of_seat, floor,class_room_number,class_room_type)
values(35,1,101,'NON A/C'),
(35,1,102,'NON A/C'),
(30,2,201,'A/C'),
(30,2,202,'A/C'),
(40,3,301,'A/C'),
(40,3,302,'A/C'),
(40,3,303,'NON A/C');