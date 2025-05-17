import json
import os
from datetime import datetime
import re

PARTNERS_FILE = 'data/partners.json'

class PartnerForm:
    def __init__(self):
        self.errors = {}
        self.form_data = {
            'name': '',
            'phone': '',
            'description': ''
        }

    def load_partners(self):
        """Выгрузка данных из файла"""
        if not os.path.exists(PARTNERS_FILE):
            return []
        try:
            with open(PARTNERS_FILE, 'r', encoding='utf-8') as f:
                return json.load(f)
        except json.JSONDecodeError:
            return[]

    def save_partners(self, partners):
        """Сохранения данных в файл"""
        with open(PARTNERS_FILE, 'w', encoding='utf-8') as f:
            json.dump(partners, f, ensure_ascii=False, indent=4)

    def is_name_exists(self, name: str) -> bool:
            """Проверяет, существует ли компания с таким названием"""
            partners = self.load_partners()
            return any(
                partner['name'].strip().lower() == name.strip().lower()
                for partner in partners
            )

    def is_phone_exists(self, phone: str) -> bool:
        """Проверяет, существует ли компания с таким телефоном"""
        partners = self.load_partners()
        # Нормализуем номер (удаляем все, кроме цифр)
        normalized_phone = re.sub(r'[^\d]', '', phone)
        return any(
            re.sub(r'[^\d]', '', partner['phone']) == normalized_phone
            for partner in partners
        )

    @staticmethod
    def is_valid_name(name: str) -> bool:
        """Проверяет, что название соответствует требованиям"""
        NAME_PATTERN = re.compile(
            r'''
            ^                                       # начало строки
            (?![\W\d_]+$)                          # не состоит только из спецсимволов и цифр
            [A-Za-zА-Яа-яЁё]                        # первая буква — латинская или кириллическая
            [A-Za-zА-Яа-яЁё\d\s.,:;"'()/-]{1,99}   # остальные символы + длина от 2 до 100
            $                                       # конец строки
            ''',
            re.IGNORECASE | re.VERBOSE
        )
        return bool(NAME_PATTERN.match(name))
    
    @staticmethod
    def is_valid_phone(phone: str) -> bool:
        """Проверяет формат телефонного номера"""
        PHONE_PATTERN = re.compile(
            r'''
            ^               # начало строки
            (\+7|\+8|7|8)?  # группа с опциональными кодами страны
            [\s]?           # опциональный пробел
            \(?             # опциональная скобка
            [489][0-9]{2}   # группа кодов оперторов, которая должна начинаться с 4/8/9
            \)?             # опциональная скобка
            [\s\-]?         # опциональнйы дефис
            [0-9]{3}        # первые 3 цифры номера
            [\s\-]?         # опциональный дефис
            [0-9]{2}        # следующие 2 цифры
            [\s\-]?         # опциональны дефис
            [0-9]{2}        # последние 2 цифры
            $               # конец строки
            ''',
            re.VERBOSE
        )
        return bool(PHONE_PATTERN.match(phone))

    @staticmethod
    def is_valid_description(description: str) -> bool:
        """Проверяет, что описание соответствует требованиям."""
        DESCRIPTION_PATTERN = re.compile(
            r'''
            ^                                       # начало строки
            (?![\W\d_]+$)                          # не состоит только из спецсимволов и цифр
            [A-Za-zА-Яа-яЁё]                        # первая буква — латинская или кириллическая
            [A-Za-zА-Яа-яЁё\d\s.,:;"'()/-]{1,499}  # остальные символы + длина от 2 до 500
            $                                       # конец строки
            ''',
            re.IGNORECASE | re.VERBOSE
        )
        return bool(DESCRIPTION_PATTERN.match(description))


    def validate(self, request):
        """Проверка данных формы с проверкой на дубли"""
        self.errors = {}
        
        # Получаем данные из формы и очищаем их
        self.form_data['name'] = request.forms.getunicode('name', '').strip()
        self.form_data['phone'] = request.forms.getunicode('phone', '').strip()
        self.form_data['description'] = request.forms.getunicode('description', '').strip()
    
        # Валидация названия
        if not self.form_data['name']:
            self.errors['name'] = 'Введите название компании'
        elif not self.is_valid_name(self.form_data['name']):
            self.errors['name'] = 'Название должно содержать минимум 2 символа, начинаться с буквы и не состоять только из цифр или символов'
        elif self.is_name_exists(self.form_data['name']):
            self.errors['name'] = 'Компания с таким названием уже существует'

        # Валидация телефона
        if not self.form_data['phone']:
            self.errors['phone'] = 'Введите телефон'
        elif not self.is_valid_phone(self.form_data['phone']):
            self.errors['phone'] = 'Неверный формат телефона'
        elif self.is_phone_exists(self.form_data['phone']):
            self.errors['phone'] = 'Этот телефон уже зарегистрирован'
            
        # Валидация описания
        if not self.form_data['description']:
            self.errors['description'] = 'Введите описание'
        elif not self.is_valid_description(self.form_data['description']):
            self.errors['description'] = 'Описание должно содержать минимум 2 символа, начинаться с буквы и не состоять только из цифр или символов'

        return not bool(self.errors)

    def add_partner(self):
        """Добавние нового парнера"""
        partners = self.load_partners()
        new_partner = {
            'name': self.form_data['name'],
            'phone': self.form_data['phone'],
            'description': self.form_data['description'],
            'date': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        }
        partners.append(new_partner)
        self.save_partners(partners)
        return partners

    def get_sorted_partners(self):
        """Возвращение отсортированного списка парнеров по дате"""
        partners = self.load_partners()
        return sorted(partners, key=lambda x: x['date'], reverse=True)

    