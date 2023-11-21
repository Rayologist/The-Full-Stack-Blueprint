#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	BEGIN;

    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
    CREATE TABLE IF NOT EXISTS users
    (
        id          UUID PRIMARY KEY,
        "firstName" TEXT                                NOT NULL,
        "lastName"  TEXT                                NOT NULL,
        email       TEXT                                NOT NULL UNIQUE,
        password    TEXT                                NOT NULL,
        "createdAt" TIMESTAMP DEFAULT current_timestamp NOT NULL,
        "updatedAt" TIMESTAMP DEFAULT current_timestamp NOT NULL
    );
    COMMIT;
EOSQL