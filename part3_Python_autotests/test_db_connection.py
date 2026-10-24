import psycopg
from psycopg import Connection, Cursor, OperationalError
from dotenv import load_dotenv, find_dotenv
import pytest
import os

load_dotenv(find_dotenv())

db_config = {
    "host": os.getenv("HOST"),
    "port": os.getenv("PORT"),
    "dbname": os.getenv("DB_NAME"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("PASSWORD")
}

def test_successful():
    try:
        conn: Connection = psycopg.connect(**db_config)
        cursor: Cursor = conn.cursor()
        cursor.execute("SELECT now()")
        result = cursor.fetchone()

        cursor.close()
        conn.close()

        assert result is not None
        print("\nПодключение прошло успешно!")

    except Exception as e:
        pytest.fail(e)

def test_unsuccessful():
    incorrect_config = db_config.copy()
    incorrect_config["password"] = "wrong_password"
    conn: Connection = psycopg.connect(**incorrect_config)
    conn.close()