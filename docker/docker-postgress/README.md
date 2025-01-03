# Docker Full-Stack App with React, Vite, and PostgreSQL

This project is a full-stack application using Docker, React, Vite, and PostgreSQL.

## Prerequisites

- Docker
- Docker Compose

## Installation and Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/your-username/your-repo.git
    cd your-repo
    ```

2. Build and start the Docker containers:
    ```sh
    docker-compose up --build
    ```

3. Access the application:
    - Frontend: `http://localhost:3000`
    - Backend API: `http://localhost:5000`
    - PostgreSQL: `localhost:5432`

## Docker Compose Configuration

The `docker-compose.yml` file includes the configuration for the frontend, backend, and PostgreSQL services.

```yaml
version: '3.8'

services:
  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
    depends_on:
      - backend

  backend:
    build: ./backend
    ports:
      - "5000:5000"
    depends_on:
      - db

  db:
    image: postgres:latest
    environment:
      POSTGRES_USER: youruser
      POSTGRES_PASSWORD: yourpassword
      POSTGRES_DB: yourdb
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```

## Environment Variables

Create a `.env` file in the root directory and add the following environment variables:

```
POSTGRES_USER=youruser
POSTGRES_PASSWORD=yourpassword
POSTGRES_DB=yourdb
```

## Running Migrations

To run database migrations, use the following command:

```sh
docker-compose exec backend npm run migrate
```

## Stopping the Application

To stop the Docker containers, run:

```sh
docker-compose down
```

## License

This project is licensed under the MIT License.