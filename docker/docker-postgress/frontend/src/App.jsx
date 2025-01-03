import { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [courses, setCourses] = useState([]);
  const [visibleTables, setVisibleTables] = useState({});

  useEffect(() => {
    console.log('Fetching courses...');
    fetch('http://localhost:5000/courses') // Ensure the URL points to the backend service
      .then((response) => {
        console.log('Fetch response:', response);
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then((data) => {
        console.log('Fetched courses:', data);
        setCourses(data);
      })
      .catch((error) => {
        console.error('Error fetching courses:', error);
        console.log('Error details:', error.message);
      });
  }, []);

  const toggleTableVisibility = (courseId) => {
    setVisibleTables((prevVisibleTables) => ({
      ...prevVisibleTables,
      [courseId]: !prevVisibleTables[courseId],
    }));
  };

  console.log('Rendering courses:', courses);

  return (
    <div>
      <h2>Courses</h2>
      {courses.length > 0 ? (
        courses.map((course) => (
          <div key={course.id}>
            <h3>{course.name}</h3>
            <p>{course.house_number} {course.street}, {course.city}, {course.state} {course.zip}, {course.country}</p>
            <p>Coordinates: {course.latitude}, {course.longitude}</p>
            <p>Park Hours: {course.park_hours}</p>
            <button onClick={() => toggleTableVisibility(course.id)}>
              {visibleTables[course.id] ? 'Hide Holes' : 'Show Holes'}
            </button>
            {visibleTables[course.id] && (
              <>
                <h4>Holes</h4>
                {course.holes && course.holes.length > 0 ? (
                  <table>
                    <thead>
                      <tr>
                        <th>Hole Number</th>
                        <th>Par</th>
                        <th>Distance</th>
                      </tr>
                    </thead>
                    <tbody>
                      {course.holes.map((hole) => (
                        <tr key={hole.hole_number}>
                          <td>{hole.hole_number}</td>
                          <td>{hole.par}</td>
                          <td>{hole.distance}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                ) : (
                  <p>No holes available</p>
                )}
              </>
            )}
          </div>
        ))
      ) : (
        <p>No courses available</p>
      )}
    </div>
  );
}

export default App;
