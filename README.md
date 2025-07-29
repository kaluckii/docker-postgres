# docker-postgre (PostgreSQL with TCP proxy over port 443)

A minimal and portable Docker setup for running PostgreSQL with external access via **port 443** using an `nginx` TCP proxy. Useful for cloud environments like Google Cloud where ports like 5432 are restricted.

---

## 📦 Features

- **PostgreSQL 16** as the main database
- **Nginx** as a raw TCP proxy to forward port 443 to 5432
- **Makefile** with cross-platform commands (Windows, Linux, macOS)
- **`.env` file** for easy configuration

---

## 🛠 Usage

| Command                  | Description                                          |
| ------------------------ | ---------------------------------------------------- |
| `make start`             | Start all containers                                 |
| `make drop`              | Stop and remove all containers                       |
| `make logs`              | Show PostgreSQL logs                                 |
| `make connect-db`        | Open `psql` session inside the database container    |
| `make connection-string` | Print external connection string using port 443      |
| `make clear-logs`        | Truncate logs of all running containers (Linux only) |
