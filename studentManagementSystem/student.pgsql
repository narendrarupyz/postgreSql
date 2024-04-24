CREATE TABLE student(
    student_id serial PRIMARY KEY,
    roll_number int NOT NULL,
    age int NOT NULL,
    address varchar(50) NOT NULL,
    pincode int,
    mobile_no varchar(10) NOT NULL,
    class_room_number int,
    FOREIGN KEY (class_room_number) REFERENCES classroom(class_room_number)
);

INSERT INTO student(roll_number, age, address, pincode, mobile_no, class_room_number)
    VALUES (10001, 15, 'Ladhak', 823893, '9823184373', 101),
(10002, 14, 'Delhi', 348999, '9832667221', 102),
(10003, 16, 'Grugram', 382382, '8734980223', 201),
(10004, 15, 'Agra', 677342, '9834662672', 301),
(10005, 12, 'Vellor', 892732, '9887428773', 202),
(10006, 14, 'Jaipur', 987238, '9823486325', 201),
(10007, 13, 'Patna', 893263, '8326237623', 101);

#show student data with associated class room with details.

SELECT
    s.student_id,
    s.roll_number,
    s.class_room_number,
    c.floor,
    c.class_room_type
FROM
    classroom c
    INNER JOIN student s ON c.class_room_number = s.class_room_number;

 student_id | roll_number | class_room_number | floor | class_room_type 
------------+-------------+-------------------+-------+-----------------
          1 |       10001 |               101 |     1 | NON A/C
          2 |       10002 |               102 |     1 | NON A/C
          3 |       10003 |               201 |     2 | A/C
          4 |       10004 |               301 |     3 | A/C
          5 |       10005 |               202 |     2 | A/C
          6 |       10006 |               201 |     2 | A/C
          7 |       10007 |               101 |     1 | NON A/C
(7 rows)

