# -*- coding: utf-8 -*-
from flask import Flask
from config import Config
from extensions import db

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)  # Загружаем настройки из config.py

    # Инициализация расширений
    db.init_app(app)

    # Регистрация маршрутов
    from routes import main
    app.register_blueprint(main)

    # Создание таблиц в БД
    with app.app_context():
        db.create_all()

    return app

# Создаем экземпляр приложения
app = create_app()

# Запуск приложения
if __name__ == '__main__':
    app.run(debug=True)
