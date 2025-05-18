% rebase('layout.tpl', title='Статьи', year=year)

<style>
    /* Общие стили статей (как в предыдущем варианте) */
    .articles-container {
        margin: 40px 0;
    }
    
    .article-card {
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        padding: 30px;
        margin-bottom: 30px;
        transition: all 0.3s ease;
    }
    
    /* Стили формы (адаптированные под ваш дизайн) */
    .form-card {
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        padding: 40px;
        margin-bottom: 50px;
        transition: all 0.3s ease;
    }
    
    .form-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }
    
    .form-title {
        color: #2c3e50;
        margin-top: 0;
        margin-bottom: 25px;
        font-size: 28px;
    }
    
    .form-group {
        margin-bottom: 20px;
    }
    
    .form-label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #2c3e50;
    }
    
    .form-input {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 16px;
        transition: border 0.3s ease;
    }
    
    .form-textarea {
        min-height: 150px;
        resize: vertical;
    }
    
    .submit-btn {
        background: #e74c3c;
        color: white;
        border: none;
        padding: 15px 30px;
        font-size: 18px;
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    /* Анимация при наведении как в вашем дизайне */
    .submit-btn:hover {
        background: #c0392b;
        transform: scale(1.05);
    }
    
    /* Разделитель */
    .section-divider {
        border: none;
        height: 1px;
        background: linear-gradient(to right, transparent, #ddd, transparent);
        margin: 50px 0;
    }
</style>

<div class="container">
    <!-- Форма добавления новой статьи -->
    <div class="form-card">
        <h2 class="form-title">Добавить новую статью</h2>
        <form action="/articles" method="POST" id="article-form">
            <div class="form-group">
                <label for="title" class="form-label">Заголовок</label>
                <input type="text" id="title" name="title" class="form-input" required>
            </div>
            
            <div class="form-group">
                <label for="author" class="form-label">Автор</label>
                <input type="text" id="author" name="author" class="form-input" required>
            </div>
            
            <div class="form-group">
                <label for="text" class="form-label">Текст статьи</label>
                <textarea id="text" name="text" class="form-input form-textarea" required></textarea>
            </div>
            
            <div class="form-group">
                <label for="date" class="form-label">Дата</label>
                <input type="date" id="date" name="date" class="form-input" required>
            </div>
            
            <div class="form-group">
                <label for="phone" class="form-label">Контактный телефон</label>
                <input type="tel" id="phone" name="phone" class="form-input" 
                       placeholder="+7 (XXX) XXX-XX-XX" required>
            </div>
            
            <button type="submit" class="submit-btn">Опубликовать статью</button>
        </form>
    </div>
    
    <hr class="section-divider">
    
    <!-- Список существующих статей -->
    <h1>Последние статьи</h1>
    
    <div class="articles-container">
        % if not articles:
        <div class="article-card">
            <p>Пока нет статей. Будьте первым!</p>
        </div>
        % else:
            % for article in articles:
            <div class="article-card">
                <div class="article-header">
                    <h2 class="article-title">{{article['title']}}</h2>
                    <div class="article-meta">
                        <span>{{article['author']}}</span> | 
                        <span>{{article['date']}}</span>
                    </div>
                </div>
                <div class="article-content">
                    <p>{{!article['text']}}</p>
                </div>
                <div class="article-actions">
                    <span class="article-contact">Контакты: {{article['phone_number']}}</span>
                </div>
            </div>
            % end
        % end
    </div>
</div>