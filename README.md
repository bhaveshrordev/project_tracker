
# Project Tracker

A simple Ruby on Rails application to manage projects and their activities.  
Users can create projects, track their status, and log activities such as status changes or comments.

---

## Features

- User-associated projects management
- Create, update, delete projects
- Track project activities (status changes, comments, etc.)
- Simple UI with project and activity views
- Basic authorization stub (assumes `current_user` is available)

---

## Tech Stack

- Rails 7.1.5
- Ruby 3.2.2
- PostgreSQL database
- RSpec for testing
- FactoryBot and Faker for test data generation

---

## Setup

### Prerequisites

- Ruby 3.2.2
- Rails 7.1.5
- PostgreSQL installed and running

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/bhaveshrordev/project_tracker.git
   cd project_tracker
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Setup database:

   Edit `config/database.yml` with your PostgreSQL credentials.

   Create and migrate the database:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. (Optional) Seed database (if seeds available):

   ```bash
   rails db:seed
   ```

5. Start the Rails server:

   ```bash
   rails server
   ```

6. Open your browser and go to:

   ```
   http://localhost:3000
   ```

---

## Running Tests

This app uses RSpec with FactoryBot and Faker.

Run the test suite with:

```bash
bundle exec rspec
```

---

## Notes

- The app assumes a `current_user` helper is available. Authentication is **not** included by default.
- Projects belong to users. Activities belong to projects and users.
- Adding a user reference to projects requires existing projects to have users assigned or migration adjustments.

---