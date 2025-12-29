# ELearning

**ELearning** is a small Rails application for managing assignments and submissions. It supports user roles (teacher, student, admin) where teachers can create assignments for students, students can submit work, and teachers can grade submissions.

---

## 🚀 Features

- Authentication using **has_secure_password** (`bcrypt`) and simple session-based login
- User roles: **teacher**, **student**, **admin** (defined in `User#role`)
- Teachers create assignments for students (`Assignment`), students submit work (`Submission`), and teachers can grade submissions
- Simple, minimal Rails 7 app using SQLite for local development

---

## 🛠️ Requirements

- Ruby **3.1.4**
- Rails **~> 7.0.8**
- SQLite3
- Bundler (for `bundle install`)

---

## ⚙️ Setup (Local Development)

1. Clone the repository:

   ```bash
   git clone <repo-url>
   cd ELearning
   ```

2. Install gems:

   ```bash
   bundle install
   ```

3. Prepare the database:

   ```bash
   bin/rails db:create db:migrate
   # Optional: seed the DB
   bin/rails db:seed
   ```

4. Create initial users (no sign-up UI by default):

   ```bash
   bin/rails console
   # Example:
   User.create!(email: 'teacher@example.com', password: 'password', password_confirmation: 'password', role: :teacher)
   User.create!(email: 'student@example.com', password: 'password', password_confirmation: 'password', role: :student)
   ```

5. Run the server:

   ```bash
   bin/rails server
   ```

   Visit `http://localhost:3000` and log in with the users you created.

---

## ✅ Running the Test Suite

This project uses the default Rails Minitest setup.

```bash
bin/rails test
```

System tests require a browser driver (Capybara + Selenium) and may need extra setup for headless runs.

---

## 🔧 Project Structure (high level)

- `app/models`: `User`, `Assignment`, `Submission`
- `app/controllers`: `AssignmentsController`, `SubmissionsController`, `SessionsController` (login flow)
- `app/views`: views for assignments, submissions, sessions, and simple layout
- `db/migrate`: migration files for users, assignments, and submissions

---

## 💡 Notes & Tips

- Authentication is simple and uses `has_secure_password`. Passwords must be provided when creating users.
- Teachers create assignments and select students; students can view their assigned assignments and submit work.
- The app uses SQLite by default which is suitable for local development. For production, switch to PostgreSQL or another DB and update `config/database.yml`.

---

## 📦 Deployment

This repository does not include a production-ready deployment configuration. Typical steps include:

1. Choose a production database (e.g., PostgreSQL) and configure `config/database.yml`.
2. Add environment variables and secrets using `credentials` or environment variables.
3. Configure a web server (Puma/nginx) and asset handling.

---

## 🙋 Feedback

If you'd like, I can:
- Add a registration flow (sign-up UI),
- Add seed data for demo users and sample assignments, or
- Add CI and deployment instructions (Heroku/GitHub Actions).

---

**Happy hacking!** 🔧
