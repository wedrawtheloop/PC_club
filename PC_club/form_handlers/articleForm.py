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

        return json_data

    def save_data(self):
        with open(ARTICLE_FILE,'w') as json_file:
            json.dump(self.data,json_file)

    def __is_author_valid(author : str) -> bool:
        author_pattern = r'^[a-zA-Zа-яА-ЯёЁ\s]+$'

        if not author.strip():
            return False
        if not re.fullmatch(author_pattern,author):
            return False

        if len(author) < 5 or len(str) > 30:
            return False
        
        return True


    def __is_title_valid(title : str) -> bool:
        title_pattern = r'^[a-zA-Zа-яА-ЯёЁ\s0-9?!&%#$@]+$'

        if not title.strip():
            return False

        if not re.fullmatch(title_pattern, title):
            return False

        if len(title) < 10:
            return False

        return True

    def __is_text_valid(text : str) -> bool:

        if not text.strip():
            return False

        if len(text) < 10 or len(text) >= 60:
            return False

        return True

    def __is_phone_number_valid(phone_number : str) -> bool:
        phone_pattern = r'^(\+7|\+8|7|8)?[\s]?\(?[489][0-9]{2}\)?[\s\-]?[0-9]{3}[\s\-]?[0-9]{2}[\s\-]?[0-9]{2}$'

        if not re.fullmatch(phone_pattern, phone_number):
            return False

        return True

    def is_data_valid(self,new_article : dict) -> bool:
        author = new_article['author']
        title = new_article['title']
        text = new_article['text']
        phone_number = new_article['phone_number']

        if not self.__is_author_valid(author):
            self.errors['author'] = 'Должно содержать только буквы. Длина должна быть не меньше 5 и не больше 30'

        if not self.__is_text_valid(text):
            self.errors['text'] = 'Текст должен содержать не менее 100 символов'

        if not self.__is_title_valid(title):
            self.errors['title'] = 'Заголовок должен содержать не менее 10 символов и не больше 60. Допустимые символы: ?!&%#$@'

        return not self.errors

    def add_article(self,new_article : dict):
        self.data.append(new_article)
        self.save_data()






