% rebase('layout.tpl', title=title, year=year)

<div class="partners-container">
    <div class="partners-header">
        <h1>{{ title }}</h1>
    </div>
    
    <div class="partners-layout">
        <!-- Форма добавления новой компании -->
        <div class="add-partner-section">
            <div class="add-partner-container">
                <h2 class="section-title">Добавить партнера</h2>
                
                % if any(errors.values()):
                <div class="alert alert-error">
                    <div class="alert-content">
                        <h4>Ошибки в форме:</h4>
                        <ul>
                            % for field, error in errors.items():
                                % if error:
                                <li>{{ error }}</li>
                                % end
                            % end
                        </ul>
                    </div>
                </div>
                % end
                
                <form action="/partners" method="post" class="partner-form">
                    <div class="form-group">
                        <label for="name">Название компании</label>
                        <input type="text" id="name" name="name" value="{{ form_data['name'] }}" 
                               class="{{ 'error-field' if errors.get('name') else '' }}" 
                               placeholder="Введите название" required>
                        % if errors.get('name'):
                        <span class="error-message">{{ errors['name'] }}</span>
                        % end
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Телефон</label>
                        <input type="tel" id="phone" name="phone" value="{{ form_data['phone'] }}" 
                               class="{{ 'error-field' if errors.get('phone') else '' }}" 
                               placeholder="+7 (XXX) XXX-XX-XX" required>
                        % if errors.get('phone'):
                        <span class="error-message">{{ errors['phone'] }}</span>
                        % end
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Описание</label>
                        <textarea id="description" name="description" 
                                  class="{{ 'error-field' if errors.get('description') else '' }}" 
                                  placeholder="Сфера деятельности" required>{{ form_data['description'] }}</textarea>
                        % if errors.get('description'):
                        <span class="error-message">{{ errors['description'] }}</span>
                        % end
                    </div>
                    
                    <button type="submit" class="submit-button">
                        Добавить компанию
                    </button>
                </form>
            </div>
        </div>
        
        <!-- Список компаний -->
        <div class="partners-list-section">
            <div class="partners-list-header">
                <h2 class="section-title">Список партнеров</h2>
                <div class="partners-count">{{ len(partners) }} компаний</div>
            </div>
            
            % if not partners:
                <div class="empty-state">
                    <p>Нет добавленных компаний</p>
                </div>
            % else:
                <div class="partners-grid">
                    % for partner in partners:
                    <div class="partner-card">
                        <div class="partner-card-header">
                            <h3>{{ partner['name'] }}</h3>
                        </div>
                        <div class="partner-card-body">
                            <div class="partner-field">
                                <span class="field-label">Телефон:</span>
                                <span class="field-value">{{ partner['phone'] }}</span>
                            </div>
                            <div class="partner-field">
                                <span class="field-label">Описание:</span>
                                <p class="field-value">{{ partner['description'] }}</p>
                            </div>
                            <div class="partner-date">
                                Добавлено: {{ partner['date'] }}
                            </div>
                        </div>
                    </div>
                    % end
                </div>
            % end
        </div>
    </div>
</div>