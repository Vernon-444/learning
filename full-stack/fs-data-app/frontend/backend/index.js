const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();
const PORT = process.env.PORT || 5000;

// Enable CORS for all routes with specific origins
app.use(cors({
  origin: ['http://localhost:5173', 'http://192.168.16.4:5173'], // Allow both local and network URLs
  methods: 'GET,POST,PUT,DELETE',
  allowedHeaders: 'Content-Type,Authorization'
}));
app.use(express.json());

const pool = new Pool({
  user: 'vernon444',
  host: 'db',
  database: 'disc_golf',
  password: 'Bvernon187227~',
  port: 5432,
});

app.get('/test-db', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.json(result.rows);
  } catch (err) {
    console.error('Error connecting to the database:', err.message);
    res.status(500).send('Database connection error');
  }
});

app.get('/courses', async (req, res) => {
  try {
    console.log('Received request for /courses');
    const result = await pool.query(`
      SELECT 
        courses.id, 
        courses.name, 
        courses.house_number, 
        courses.street, 
        courses.city, 
        courses.state, 
        courses.zip, 
        courses.country, 
        courses.latitude, 
        courses.longitude, 
        courses.park_hours,
        json_agg(
          json_build_object(
            'hole_number', holes.hole_number,
            'par', holes.par,
            'distance', holes.distance
          )
        ) AS holes
      FROM courses
      LEFT JOIN holes ON courses.id = holes.course_id
      GROUP BY courses.id
    `);
    console.log('Database query result:', result.rows);
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching courses:', err.message);
    res.status(500).send('Server Error');
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});