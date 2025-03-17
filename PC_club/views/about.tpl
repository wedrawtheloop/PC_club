% rebase('layout.tpl', title='О клубе', year=year)

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f9f9f9;
        color: #333;
        line-height: 1.6;
    }

    h2 {
        font-size: 36px;
        color: #2c3e50;
        text-align: center;
        margin-bottom: 30px;
    }

    h3 {
        font-size: 28px;
        color: #34495e;
        margin-top: 40px;
        margin-bottom: 20px;
    }

    p {
        font-size: 18px;
        margin-bottom: 20px;
    }

    .about-content {
        display: flex;
        align-items: center;
        gap: 40px;
        background: #fff;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        margin-bottom: 40px;
    }

    .about-content img {
        max-width: 400px;
        height: auto;
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .about-text {
        flex: 1; /* Текст занимает оставшееся пространство */
    }

    .mission-section h3 {
        color: #fff;
        margin-bottom: 20px;
    }

    .mission-section p {
        font-size: 20px;
        line-height: 1.8;
    }

    .why-us-section {
        background: #fff;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        margin-top: 40px;
    }

    .advantages-list {
        list-style-type: none;
        padding: 0;
    }

    .advantages-list li {
        position: relative;
        padding-left: 30px;
        margin-bottom: 15px;
    }

    .advantages-list li::before {
        content: "✔";
        color: #27ae60;
        font-size: 20px;
        position: absolute;
        left: 0;
        top: 0;
    }

    .cta-button {
        display: inline-block;
        margin-top: 30px;
        padding: 15px 30px;
        font-size: 18px;
        color: #fff;
        background: #e74c3c;
        border-radius: 50px;
        text-decoration: none;
        transition: background 0.3s ease;
    }

    .cta-button:hover {
        background: #c0392b;
    }

    @media (max-width: 768px) {
        .about-content {
            flex-direction: column;
            text-align: center;
        }

        .about-content img {
            max-width: 100%;
        }
    }
</style>

<div class="container">
    <h2>{{ title }}</h2>
    <h3>{{ message }}</h3>

    <div class="about-content">
        <img src="/static/images/about.jpg" alt="Фото компьютерного клуба">
        <div class="about-text">
            <p>
                Мы — место, где встречаются технологии, игры и комфорт. 
                Наш клуб предлагает современное оборудование, высокоскоростной интернет и уютную атмосферу для всех, кто любит игры, программирование 
                или просто хочет провести время за компьютером.
            </p>
        </div>
    </div>

    <div class="mission-section">
        <h3>Наша миссия</h3>
        <p>
            Мы стремимся создать пространство, где каждый сможет найти что-то для себя: 
            будь то игры, обучение программированию или просто отдых в кругу друзей. 
            Наша цель — сделать технологии доступными и интересными для всех.
        </p>
    </div>

    <div class="why-us-section">
        <h3>Почему мы?</h3>
        <ul class="advantages-list">
            <li>Мощные игровые компьютеры с топовыми видеокартами.</li>
            <li>Высокоскоростной интернет для комфортной игры и работы.</li>
            <li>Удобные игровые зоны с эргономичными креслами.</li>
            <li>Регулярные турниры по популярным играм.</li>
            <li>Коворкинг-зона для работы и учебы.</li>
        </ul>
    </div>

    <div style="text-align: center; margin-top: 40px;">
        <a href="/contact" class="cta-button">Присоединяйтесь к нам!</a>
    </div>
</div>