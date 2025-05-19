import json
import os
from datetime import datetime
import re

ARTICLE_FILE = 'data/articles.json'

class ArticleForm:
    def __init__(self):
        self.errors = {}
        self.data = self.load_data()

    def load_data(self):
        json_data = []

        try:
            with open(ARTICLE_FILE, 'r', encoding='utf-8') as json_file:
                json_data = json.load(json_file)
        except:
            json_data = []

        json_data = sorted(json_data, key=lambda x: x['date'], reverse=True)
        return json_data

    def save_data(self):
        with open(ARTICLE_FILE,'w', encoding='utf-8') as json_file:
            json.dump(self.data,json_file, ensure_ascii=False, indent=4)



    def is_author_valid(self,author : str) -> bool:
        author_pattern = r'^[a-zA-Zа-яА-ЯёЁ\s]+$'

        if not author.strip():
            return False
        if not re.fullmatch(author_pattern,author):
            return False

        if len(author) < 5 or len(author) > 30:
            return False
        
        return True


    def is_title_valid(self,title : str) -> bool:
        title_pattern = r'^[a-zA-Zа-яА-ЯёЁ\s0-9!@#$%^&*()_+-=.,/?]+$'

        if not title.strip():
            return False

        if not re.fullmatch(title_pattern, title):
            return False

        if len(title) < 10 or len(title) >= 60:
            return False

        return True

    def is_text_valid(self,text : str) -> bool:

        if not text.strip():
            return False

        if len(text) < 50:
            return False

        return True

    def is_phone_number_valid(self,phone_number : str) -> bool:
        phone_pattern = r'^(\+7|\+8|7|8)[\s\-]?\(?[0-9]{3}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$'
        if not re.fullmatch(phone_pattern, phone_number):
            return False

        return True

    def is_data_valid(self,new_article : dict) -> bool:
        self.errors = {}
        author = new_article['author']
        title = new_article['title']
        text = new_article['text']
        phone_number = new_article['phone_number']

        if not self.is_author_valid(author):
            self.errors['author'] = 'Должно содержать не менее 5 и не больше 30 символов. Допустимы только буквы'

        if not self.is_text_valid(text):
            self.errors['text'] = 'Текст должен быть не короче 50 символов'

        if not self.is_title_valid(title):
            self.errors['title'] = 'Заголовок должен быть не короче 10 символов и не длиннее 60. Допустимые спец. символы: !@#$%^&*()_+-=..,>/?'
        
        if not self.is_phone_number_valid(phone_number):
            self.errors['phone_number'] = 'Неверный формат'

        return not self.errors

    def add_article(self,new_article : dict):
        self.data.append(new_article)
        self.save_data()






