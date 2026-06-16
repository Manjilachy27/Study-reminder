# Study Reminder Deployment Guide

## Quick Start

### Prerequisites
- Java 17+
- Maven 3.6+
- Supabase Account

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/Manjilachy27/Study-reminder.git
cd Study-reminder/backend
```

2. Create `.env` file:
```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
PORT=8080
FRONTEND_ORIGIN=http://localhost:5173,http://localhost:8080
```

3. Run the application:
```bash
mvn spring-boot:run
```

Access at: `http://localhost:8080`

---

## Deployment Options

### Option 1: Render.com (Recommended - Free)

1. Go to [render.com](https://render.com)
2. Click **New+ → Web Service**
3. Connect your GitHub account
4. Select the **Study-reminder** repository
5. Configure:
   - **Name**: `study-reminder-backend`
   - **Runtime**: Java
   - **Build**: `mvn clean package -DskipTests`
   - **Start**: `java -jar target/study-reminder-backend-1.0.0.jar`

6. Add Environment Variables:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`
   - `PORT=8080`

7. Deploy and get your URL!

---

### Option 2: Railway.app (Easy Setup)

1. Go to [railway.app](https://railway.app)
2. Click **New Project**
3. Select **Deploy from GitHub**
4. Choose the repository
5. Add environment variables
6. Deploy!

---

### Option 3: Heroku (Classic)

```bash
heroku create your-app-name
heroku config:set SUPABASE_URL=xxx SUPABASE_ANON_KEY=xxx
git push heroku main
```

---

## API Endpoints

### Public Endpoints
- `GET /` - Home page
- `GET /config` - Public Supabase config
- `GET /login.html` - Login page
- `GET /signup.html` - Signup page

### Protected Endpoints (Require JWT)
- `GET /reminders` - List reminders
- `POST /reminders` - Create reminder
- `PUT /reminders/{id}` - Update reminder
- `DELETE /reminders/{id}` - Delete reminder
- `GET /dashboard.html` - Dashboard

---

## Technology Stack

- **Backend**: Spring Boot 3.3.5
- **Language**: Java 17
- **Database**: Supabase PostgreSQL
- **Auth**: Supabase JWT
- **Frontend**: HTML/CSS/JavaScript
- **Deployment**: GitHub Actions (CI/CD)

---

## Need Help?

- Check the [README.md](../README.md)
- Open an issue on [GitHub](https://github.com/Manjilachy27/Study-reminder/issues)
- Review the [backend code](../src)

---

**Happy studying! 📚**
