# config.py
import os

class Config:
    # ��������� ���� ������
    SQLALCHEMY_DATABASE_URI = 'postgresql://postgres:12345@localhost:5432/agrosmart2''?client_encoding=utf8'
    SQLALCHEMY_TRACK_MODIFICATIONS = False  # ��������� ����������� �� ����������