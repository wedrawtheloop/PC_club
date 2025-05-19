import unittest
from form_handlers.patrners_form import PartnerForm

class TestPhonePattern(unittest.TestCase):
    def test_valid_phones(self):
        """Проверка валидных номеров"""
        valid_phones = [
            '+79123456789',         # с кодом +7
            '79123456789',          # с кодом 7
            '89123456789',          # с кодом 8
            '+89123456789',         # c кодом +8
            '+7 912 345 67 89',     # Разделенный пробелами
            '8 (912) 345-67-89',    # Разделенный пробелами, скобками, дефисами
            '9123456789',           # Без кода страны
            '+7 912-345-67-89',     # C пробелом и дефисом
            '8(912)345-67-89',      # С дефисами и скобками
            '+8921-541-87-39',      # С дефисами
            '7(921)5890954'         # C скобками
        ]
        for phone in valid_phones:
            self.assertTrue(PartnerForm.is_valid_phone(phone))

    def test_invalid_phones(self):
        """Проверка невалидных номеров"""
        invalid_phones = [
            '123',                  
            '+7912345678901',       # Длинный номер
            '8 800 555 35',         # Короткий номер
            '+7 (912) ABC-67-89',   # Содержит буквенные символы
            '+7 100 765 83 21',     # Некорректный код оператора
            'телефон',              # Состоит из буквунных символов          
            '+A 777 888-59-01',     # Содержит буквы
            '',                     # Пустой
            '+8 91',                # Слишком короткий
            '+B (XXX) X0X-2X-21'    
        ]
        for phone in invalid_phones: 
            self.assertFalse(PartnerForm.is_valid_phone(phone))

if __name__ == '__main__':
    unittest.main()
