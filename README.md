# Установка и запуск
1. Клонируйте репозиторий.
2. Создайте виртуальное окружение: python -m venv venv && source venv/bin/activate (или venv\Scripts\activate на Windows).
3. Установите зависимости: pip install -r requirements.txt.
4. Скопируйте .env.example в .env и заполните данные вашего локального PostgreSQL.

# Запуск тестов

Выполните команду:

```bash```
pytest -v modulbank-test\part3_Python_autotests
