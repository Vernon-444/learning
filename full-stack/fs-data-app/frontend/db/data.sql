-- Sample data into courses table
INSERT INTO courses (name, house_number, street, city, state, zip, country, latitude, longitude, park_hours)
VALUES 
('Redhawk DGC', '1234',  'Mohawk BLVD', 'Tulsa', 'OK', '74133', 'USA', 36.123456, -95.123456, 'Sunrise to Sunset'),
('Hunter Park DGC', '1234', 'Main ST', 'Tulsa', 'OK', '74133', 'USA', 36.123456, -95.123456, 'Sunrise to Sunset');

-- Sample data into holes table
INSERT INTO holes (course_id, hole_number, par, distance, basket_type)
VALUES 
(1, 1, 3, 300, 'Mach 3'),
(1, 2, 3, 300, 'Mach 3'),
(1, 3, 3, 300, 'Mach 3'),
(1, 4, 3, 300, 'Mach 3'),
(1, 5, 3, 300, 'Mach 3'),
(1, 6, 3, 300, 'Mach 3'),
(1, 7, 3, 300, 'Mach 3'),
(1, 8, 3, 300, 'Mach 3'),
(1, 9, 3, 300, 'Mach 3'),
(1, 10, 3, 300, 'Mach 3'),
(1, 11, 3, 300, 'Mach 3'),
(1, 12, 3, 300, 'Mach 3'),
(1, 13, 3, 300, 'Mach 3'),
(1, 14, 3, 300, 'Mach 3'),
(1, 15, 3, 300, 'Mach 3'),
(1, 16, 3, 300, 'Mach 3'),
(1, 17, 3, 300, 'Mach 3'),
(1, 18, 3, 300, 'Mach 3'),
(2, 1, 3, 300, 'Mach 3'),
(2, 2, 3, 300, 'Mach 3'),
(2, 3, 3, 300, 'Mach 3'),
(2, 4, 3, 300, 'Mach 3'),
(2, 5, 3, 300, 'Mach 3'),
(2, 6, 3, 300, 'Mach 3'),
(2, 7, 3, 300, 'Mach 3'),
(2, 8, 3, 300, 'Mach 3'),
(2, 9, 3, 460, 'Mach 3'),
(2, 10, 3, 300, 'Mach 3'),
(2, 11, 3, 300, 'Mach 3'),
(2, 12, 3, 300, 'Mach 3'),
(2, 13, 3, 300, 'Mach 3'),
(2, 14, 3, 300, 'Mach 3'),
(2, 15, 3, 300, 'Mach 3'),
(2, 16, 3, 300, 'Mach 3'),
(2, 17, 3, 300, 'Mach 3'),
(2, 18, 3, 300, 'Mach 3');

-- Sample data into tee_pads table
INSERT INTO tee_pads (course_id, hole_id, tee_pad_number, latitude, longitude)
VALUES 
(1, 1, 1, 36.123456, -95.123456),
(1, 2, 1, 36.123456, -95.123456),
(1, 3, 1, 36.123456, -95.123456),
(1, 4, 1, 36.123456, -95.123456),
(1, 5, 1, 36.123456, -95.123456),
(1, 6, 1, 36.123456, -95.123456),
(1, 7, 1, 36.123456, -95.123456),
(1, 8, 1, 36.123456, -95.123456),
(1, 9, 1, 36.123456, -95.123456),
(1, 10, 1, 36.123456, -95.123456),
(1, 11, 1, 36.123456, -95.123456),
(1, 12, 1, 36.123456, -95.123456),
(1, 13, 1, 36.123456, -95.123456),
(1, 14, 1, 36.123456, -95.123456),
(1, 15, 1, 36.123456, -95.123456),
(1, 16, 1, 36.123456, -95.123456),
(1, 17, 1, 36.123456, -95.123456),
(1, 18, 1, 36.123456, -95.123456),
(2, 1, 1, 36.123456, -95.123456),
(2, 2, 1, 36.123456, -95.123456),
(2, 3, 1, 36.123456, -95.123456),
(2, 4, 1, 36.123456, -95.123456),
(2, 5, 1, 36.123456, -95.123456),
(2, 6, 1, 36.123456, -95.123456),
(2, 7, 1, 36.123456, -95.123456),
(2, 8, 1, 36.123456, -95.123456),
(2, 9, 1, 36.123456, -95.123456),
(2, 10, 1, 36.123456, -95.123456),
(2, 11, 1, 36.123456, -95.123456),
(2, 12, 1, 36.123456, -95.123456),
(2, 13, 1, 36.123456, -95.123456),
(2, 14, 1, 36.123456, -95.123456),
(2, 15, 1, 36.123456, -95.123456),
(2, 16, 1, 36.123456, -95.123456),
(2, 17, 1, 36.123456, -95.123456),
(2, 18, 1, 36.123456, -95.123456);

-- Sample data into baskets table
INSERT INTO baskets (course_id, hole_id, basket_number, latitude, longitude)
VALUES 
(1, 1, 1, 36.123456, -95.123456),
(1, 2, 1, 36.123456, -95.123456),
(1, 3, 1, 36.123456, -95.123456),
(1, 4, 1, 36.123456, -95.123456),
(1, 5, 1, 36.123456, -95.123456),
(1, 6, 1, 36.123456, -95.123456),
(1, 7, 1, 36.123456, -95.123456),
(1, 8, 1, 36.123456, -95.123456),
(1, 9, 1, 36.123456, -95.123456),
(1, 10, 1, 36.123456, -95.123456),
(1, 11, 1, 36.123456, -95.123456),
(1, 12, 1, 36.123456, -95.123456),
(1, 13, 1, 36.123456, -95.123456),
(1, 14, 1, 36.123456, -95.123456),
(1, 15, 1, 36.123456, -95.123456),
(1, 16, 1, 36.123456, -95.123456),
(1, 17, 1, 36.123456, -95.123456),
(1, 18, 1, 36.123456, -95.123456),
(2, 1, 1, 36.123456, -95.123456),
(2, 2, 1, 36.123456, -95.123456),
(2, 3, 1, 36.123456, -95.123456),
(2, 4, 1, 36.123456, -95.123456),
(2, 5, 1, 36.123456, -95.123456),
(2, 6, 1, 36.123456, -95.123456),
(2, 7, 1, 36.123456, -95.123456),
(2, 8, 1, 36.123456, -95.123456),
(2, 9, 1, 36.123456, -95.123456),
(2, 10, 1, 36.123456, -95.123456),
(2, 11, 1, 36.123456, -95.123456),
(2, 12, 1, 36.123456, -95.123456),
(2, 13, 1, 36.123456, -95.123456),
(2, 14, 1, 36.123456, -95.123456),
(2, 15, 1, 36.123456, -95.123456),
(2, 16, 1, 36.123456, -95.123456),
(2, 17, 1, 36.123456, -95.123456),
(2, 18, 1, 36.123456, -95.123456);