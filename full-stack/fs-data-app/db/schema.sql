-- Create table for disc golf course
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    house_number VARCHAR(10) NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    country VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    park_hours VARCHAR(100) NOT NULL
);

-- Create Table for holes
CREATE TABLE holes (
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    hole_number INT NOT NULL,
    par INT NOT NULL,
    distance INT NOT NULL,
    basket_type VARCHAR(100) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Create table for tee pads
CREATE TABLE tee_pads (
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    hole_id INT NOT NULL,
    tee_pad_number INT NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (hole_id) REFERENCES holes(id)
);

-- Create table for baskets
CREATE TABLE baskets (
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    hole_id INT NOT NULL,
    basket_number INT NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (hole_id) REFERENCES holes(id)
);
