% rebase('layout.tpl', title='Статьи', year=year)


<div class="container">
    <!-- Форма добавления новой статьи -->
    <div class="form-card">
        <h2 class="form-title">Добавить новую статью</h2>
        <form action="/articles" method="POST" id="article-form">
            <div class="form-group">
                <label for="title" class="form-label">Заголовок</label>
                <input type="text" id="title" name="title" class="form-input" value = "{{form_data.get('title','')}}" required>
                % if errors.get('title'):
                    <div class="error-message">
                        <p>{{errors['title']}}</p>
                    </div>
                % end
            </div>
            
            <div class="form-group">
                <label for="author" class="form-label">Автор</label>
                <input type="text" id="author" name="author" class="form-input" value = "{{form_data.get('author','')}}" required>
                % if errors.get('author'):
                    <div class="error-message">
                        <p>{{errors['author']}}</p>
                    </div>
                % end
            </div>
            
            <div class="form-group">
                <label for="text" class="form-label">Текст статьи</label>
                <textarea id="text" name="text" class="form-input form-textarea"  required>{{form_data.get('text','')}}</textarea>
                % if errors.get('text'):
                    <div class="error-message">
                        <p>{{errors['text']}}</p>
                    </div>
                % end
            </div>
            
            <div class="form-group">
                <label for="phone_number" class="form-label">Контактный телефон</label>
                <input type="tel" id="phone_number" name="phone_number" class="form-input" 
                       placeholder="+7 (XXX) XXX-XX-XX" value = "{{form_data.get('phone_number','')}}" required>
                % if errors.get('phone_number'):
                    <div class="error-message">
                        <p>{{errors['phone_number']}}</p>
                    </div>
                % end
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