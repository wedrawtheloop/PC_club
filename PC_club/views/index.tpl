% rebase('layout.tpl', title='Главная страница', year=year)

<style>
    /* Общие стили */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f9f9f9;
        color: #333;
        line-height: 1.6;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    /* Стиль для всех карточек */
    .card {
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        padding: 40px;
        margin: 30px 0;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }

    /* Герой-секция */
    .hero-wrapper {
        position: relative;
        background-image: url('/static/images/main.jpg');
        background-size: cover;
        background-position: center;
        margin-bottom: 40px;
    }

    .hero-wrapper::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        z-index: 1;
    }

    .hero-section {
        position: relative;
        z-index: 2;
        color: #fff;
        padding: 100px 20px;
        text-align: center;
    }

    .hero-section h1 {
        font-size: 48px;
        margin-bottom: 20px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }

    .hero-section p {
        font-size: 24px;
        margin-bottom: 40px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }

    /* Кнопки */
    .cta-button {
        display: inline-block;
        padding: 15px 30px;
        font-size: 18px;
        color: #fff;
        border-radius: 8px;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .primary-btn {
        background: #e74c3c;
    }

    .primary-btn:hover {
        background: #c0392b;
        transform: scale(1.05);
    }

    .secondary-btn {
        background: #27ae60;
    }

    .secondary-btn:hover {
        background: #219653;
        transform: scale(1.05);
    }

    /* Секция возможностей */
    .features-section {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        padding: 40px 0;
    }

    .feature-card {
        text-align: center;
        padding: 30px;
    }

    .feature-card h3 {
        font-size: 24px;
        color: #2c3e50;
        margin-bottom: 15px;
    }

    .feature-card p {
        font-size: 16px;
        color: #666;
    }

    /* Секция "О нас" */
    .about-section {
        text-align: center;
        transition: background 1.5s ease, box-shadow 0.3s ease, color 0.3s ease, transform 0.3s ease;
    }

    .about-section:hover {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        color: #ffffff;
    }

    .about-section h2 {
        font-size: 36px;
        margin-bottom: 30px;
    }

    .about-section p {
        font-size: 18px;
        line-height: 1.8;
        max-width: 800px;
        margin: 0 auto 30px;
    }

    /* Секция турниров */
    .tournaments-section {
        text-align: center;
    }

    .tournaments-section:hover {
        background: linear-gradient(135deg, #8B0000, #FF0000);
        color: #ffffff;
    }

    .tournaments-section h2 {
        font-size: 36px;
        margin-bottom: 30px;
    }

    .tournaments-section p {
        font-size: 18px;
        line-height: 1.8;
        max-width: 800px;
        margin: 0 auto 30px;
    }

    /* Футер */
    footer {
        background: #2c3e50;
        color: #fff;
        text-align: center;
        padding: 20px;
        margin-top: 60px;
    }

    footer p {
        margin: 0;
    }
</style>

<div class="hero-wrapper">
    <div class="hero-section">
        <h1>Добро пожаловать в наш компьютерный клуб!</h1>
        <p>Место, где технологии встречаются с комфортом и азартом.</p>
        <a href="/about" class="cta-button primary-btn">Узнать больше</a>
    </div>
</div>

<div class="container">
    <!-- Секция возможностей -->
    <div class="features-section">
        <div class="card feature-card">
            <h3>Мощные компьютеры</h3>
            <p>Топовое оборудование для комфортной игры и работы.</p>
        </div>
        <div class="card feature-card">
            <h3>Высокоскоростной интернет</h3>
            <p>Стабильное соединение для игр и потоковой передачи.</p>
        </div>
        <div class="card feature-card">
            <h3>Турниры и события</h3>
            <p>Регулярные соревнования и мероприятия для всех.</p>
        </div>
    </div>

    <!-- Секция "О нас" -->
    <div class="card about-section">
        <h2>О нас</h2>
        <p>
            Мы — современный компьютерный клуб, предлагающий лучшее оборудование, 
            высокоскоростной интернет и уютную атмосферу для игр, работы и отдыха. 
            Присоединяйтесь к нам и откройте мир технологий!
        </p>
        <a href="/about" class="cta-button secondary-btn">Подробнее</a>
    </div>

    <!-- Секция турниров -->
    <div class="card tournaments-section">
        <h2>Турниры и события</h2>
        <p>
            Участвуйте в наших турнирах по популярным играм и выигрывайте призы! 
            Следите за расписанием и не пропустите следующее событие.
        </p>
        <a href="/tournaments" class="cta-button primary-btn">Участвовать</a>
    </div>
</div>
