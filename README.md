# Study Reminder Backend

A Spring Boot backend for the Study Reminder application with Supabase integration.

## Tech Stack

- **Framework**: Spring Boot 3.3.5
- **Language**: Java 17
- **Database**: Supabase (PostgreSQL with RLS)
- **Authentication**: Supabase JWT
- **API**: REST with Spring Security

## Features

- User authentication via Supabase
- CRUD operations for study reminders
- Role-based access control
- CORS support
- Exception handling
- Frontend serving (HTML/CSS/JS)

## Prerequisites

- Java 17
- Maven 3.6+
- Supabase account with:
  - Project URL
  - Anon Key
  - Database with `study_reminders` table

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/Manjilachy27/Study-reminder.git
cd Study-reminder/backend
```

### 2. Configure environment variables

Create a `.env` file:

```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
PORT=8080
FRONTEND_ORIGIN=http://localhost:5173,http://localhost:8080
```

### 3. Build the project

```bash
mvn clean package
```

### 4. Run the application

```bash
mvn spring-boot:run
```

Or run the packaged JAR:

```bash
java -jar target/study-reminder-backend-1.0.0.jar
```

The application will start on `http://localhost:8080`

## API Endpoints

### Public Endpoints

- `GET /` - Redirect to login/dashboard
- `GET /config` - Get public Supabase configuration
- `GET /login.html` - Login page
- `GET /signup.html` - Signup page
- `GET /actuator/health` - Health check

### Protected Endpoints

Require JWT token in `Authorization: Bearer <token>` header

- `GET /reminders` - List all reminders for current user
- `POST /reminders` - Create a new reminder
- `PUT /reminders/{id}` - Update a reminder
- `DELETE /reminders/{id}` - Delete a reminder
- `GET /dashboard.html` - Dashboard page

## Deployment

### Heroku

```bash
heroku create your-app-name
git push heroku main
heroku config:set SUPABASE_URL=your-url SUPABASE_ANON_KEY=your-key
```

### AWS Elastic Beanstalk

```bash
eb create study-reminder
eb setenv SUPABASE_URL=your-url SUPABASE_ANON_KEY=your-key
eb deploy
```

### Docker

Build and run with Docker:

```bash
docker build -t study-reminder-backend .
docker run -p 8080:8080 \
  -e SUPABASE_URL=your-url \
  -e SUPABASE_ANON_KEY=your-key \
  study-reminder-backend
```

## Database Schema

The application expects a `study_reminders` table with:

```sql
CREATE TABLE study_reminders (
  id UUID PRIMARY KEY,
  user_id UUID NOT NULL,
  title VARCHAR(200) NOT NULL,
  description VARCHAR(2000),
  type VARCHAR(50),
  priority VARCHAR(50),
  due_date TIMESTAMP,
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW()
);
```

## License

MIT

## Author

Manjil
