import unittest
from form_handlers.articleForm import ArticleForm

class TestArticleForm(unittest.TestCase):
    def setUp(self):
        self.form = ArticleForm()

    def test_phone_number(self):
        valid_values = ['+79161234567',
        '89161234567',
        '79161234567',
        '89161234567',
        '+7 916 123 45 67',
        '8 (916) 123-45-67',
        '8 916-123-45-67',
        '+7(916)1234567',
        '8-916-123-45-67',
        '+7 916 1234567']

        invalid_values = [
            '',
            '         ',
            '12334',
            'qwertyu',
            '+1 234 567 8901',
            '+7 (800) ABC-12-34',
            '89001002030000',
            '8 800 123-45-6-7',
            '+7 916 123 45 67 89',
            '+99161234567'
        ]

        for number in valid_values:
            self.assertTrue(self.form.is_phone_number_valid(number), f'{number} - номер должен быть валидным')
        
        for invalid_number in invalid_values:
            self.assertFalse(self.form.is_phone_number_valid(invalid_number), f'{invalid_number} - номер должен быть невалидным')
    
    def test_author(self):
        valid_values = ['Иванов Иван', 'Петров Петр', 'Сидоров Сидор', 'Thomas Edison', 'Nikola Tesla']
        invalid_values = [
            '',
            '         ',
            '123',
            'qwertyu123',
            '+7 916 123 45 67',
            '+7 (800) ABC-12-34',
            'Иванов-Иванович',
            'Иванов_Иван',
            'C00l N@me'
        ]
        for author in valid_values:
            self.assertTrue(self.form.is_author_valid(author), f'{author} - автор должен быть валидным')
        
        for invalid_author in invalid_values:
            self.assertFalse(self.form.is_author_valid(invalid_author), f'{invalid_author} - автор должен быть невалидным')
    
if __name__ == "__main__":
    unittest.main()

