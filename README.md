# Acme Corporation Employee Registry

## Overview

Acme Corporation, the world’s leading manufacturer of explosives, requires an employee registry to manage its workforce efficiently. This registry is developed using Ruby on Rails with PostgreSQL as the database. The project consists of two primary modules: Departments and Employees, along with additional features such as authentication, invoicing, and GraphQL support.

## Project Setup
1. Install Ruby 3.0.6
2. Install Rails 7.1.5.1
3. Set up PostgreSQL as the database
4. Redis (for Sidekiq background jobs)
5. Clone the repository and install dependencies:
```
git clone <repo_url>
bundle install
```
6. Setup the database:
```
rails db:create db:migrate db:seed
```
7. Start the Rails server:
```
rails server
```
8. Start Sidekiq (for background jobs):
```
bundle exec sidekiq
```

## Admin & Default User Access

### Admin Credentials
- Email: `admin@1.com`
- password: `123456`
- Permission: Full access (except creating new employee)

### Default Employee Credentials
- Email: `ro@1.com`
- password: `123456`
- Permissions: View profile only

## Testing
- RSpec is used for testing models and features.
- Run tests:
```
bundle exec rspec
```