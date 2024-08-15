# User Metrics Data Ingestion Pipeline

## Overview

This project provides a data ingestion pipeline for user metrics, including `talked_time`, `microphone_used`, `speaker_used`, and `voice_sentiment`. The pipeline is designed to ingest metrics data into a PostgreSQL database. The solution is containerized using Docker and Docker Compose for easy setup and deployment.

## Project Structure

### Explanation:

- **app/**: This directory contains the Dockerfile and other files related to that application.
- **pgdata/**: This directory is where PostgreSQL stores its data. It is typically mounted as a volume in the Docker Compose configuration to ensure data persistence.
- **docker-compose.yml**: The main file that defines and orchestrates the Docker containers.
- **schema.sql**: Contains the SQL commands to set up the necessary database schema.
- **README.md**: The documentation file that explains how to set up and run the project.

## Setup and Installation

### Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)


### Steps to Set Up the Project

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/SargsyanSuren/User-Metrics-Data-Ingestion-Pipeline.git
   cd user-metrics-pipeline
   ```
2. Build and Run the Containers:

   Use Docker Compose to build and run the containers:
   ```bash
   docker-compose up --build
   ```
3. Access the PostgreSQL Database:

    You can connect to the PostgreSQL database using a PostgreSQL client or through the command line:
    ```bash
    docker exec -it user-metrics-pipeline-db-1 psql -U user -d user_metrics
    ```

## Database Schema


The `user_metrics` table is designed to store various types of user metrics. Below is a detailed explanation of each column in the table:

1. **id (UUID)**:
   - This is the primary key for the table. It uniquely identifies each record in the `user_metrics` table.

2. **user_id (UUID)**:
   - This column stores a unique identifier for each user. It helps in tracking which user the metric data belongs to.

3. **session_id (UUID)**:
   - This column contains a unique identifier for each session. It links metrics to specific user sessions.

4. **timestamp (TIMESTAMP)**:
   - This column records the exact time when the metric was captured.

5. **metric_type (VARCHAR(50))**:
   - This column specifies the type of metric being recorded (e.g., `talked_time`, `microphone_used`, `speaker_used`, `voice_sentiment`).

6. **metric_value (JSONB)**:
   - This column stores the value of the metric in JSON format, allowing for flexibility in data types and structures.

7. **additional_metadata (JSONB)**:
   - This column is used to store any additional information related to the metric, also in JSON format.


# Running the Application

### Inserting Data into the Database

I have already insert some data for testing etc. and you also can manually insert user metrics data into the `user_metrics` table using SQL commands. If you want to see the data you wrote, you can use the comand:
```sql
SELECT * FROM user_metrics;
```
Below are examples of how to insert data:

```sql
-- Example 1: Inserting a 'talked_time' metric
INSERT INTO user_metrics (id, user_id, session_id, timestamp, metric_type, metric_value, additional_metadata)
VALUES (uuid_generate_v4(), '423545gf-533b-12c8-a456-4266947674000', '95467577653-221a-1983-a456-426614174000', NOW(), 'talked_time', '{"value": 120}', '{}');

-- Example 2: Inserting a 'microphone_used' metric
INSERT INTO user_metrics (id, user_id, session_id, timestamp, metric_type, metric_value, additional_metadata)
VALUES (uuid_generate_v4(), '142354yj67-et9b-12d3-mk56-4269074174000', '983456h543-b21a-12d3-a456-427867544000', NOW(), 'microphone_used', '{"value": true}', '{}');
```
And how to see list all tables:
```sql
/dt
```
# Example Output

### Example Output

After running `SELECT * FROM user_metrics;`, you should see output similar to this (depending on your inserted data):

| id                                   | user_id                             | session_id                          | timestamp           | metric_type       | metric_value       | additional_metadata |
|--------------------------------------|-------------------------------------|-------------------------------------|---------------------|-------------------|--------------------|----------------------|
| 123e4567-e89b-12d3-a456-426614174000 | 123e4567-e89b-12d3-a456-426614174000| 987e6543-b21a-12d3-a456-426614174000| 2024-08-14 10:45:00 | talked_time       | {"value": 120}     | {}                   |
| 223e4567-e89b-12d3-a456-426614174000 | 123e4567-e89b-12d3-a456-426614174000| 987e6543-b21a-12d3-a456-426614174000| 2024-08-14 11:00:00 | microphone_used   | {"value": true}    | {}                   |



# Conclusion

This documentation provides all the necessary information to set up, run, and extend the user metrics data ingestion pipeline. If you encounter any issues or have suggestions for improvement, please feel free to contribute to the repository.
