<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - My Bottle Application</title>
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
</head>

<style>
    .contacts-container {
        display: flex;
        gap: 20px;
        padding: 20px;
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .contact-card {
        width: 300px;
        height: 200px;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        position: relative;
        overflow: hidden;
        transition: all 0.3s ease;
        background-color: white;
    }
    
    .contact-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-size: cover;
        opacity: 0;
        transition: opacity 0.3s ease;
        z-index: 0;
    }
    
    /* Стили для карточек с изображениями */
    .contact-card.card1::before {
        background-image: url('/static/images/danechek.jpg');
    }
    
    .contact-card.card3::before {
        background-image: url('/static/images/aldarchik.jpg');
    }
    
    /* Стили для карточки с GIF */
    .contact-card.card2::before {
        background-image: url('/static/images/maksmchik.gif');
        opacity: 0; /* GIF изначально скрыт */
    }
    
    /* Показываем фон при наведении */
    .contact-card:hover::before {
        opacity: 0.1; /* Прозрачность для изображений */
    }
    
    /* Отдельное правило для GIF */
    .contact-card.card2:hover::before {
        opacity: 0.1; /* Прозрачность для GIF */
    }
    
    .contact-content {
        position: relative;
        z-index: 1;
    }
    
    .contact-name {
        font-size: 1.5em;
        margin: 0 0 10px 0;
        color: #333;
    }
    
    .contact-info {
        margin: 5px 0;
        color: #666;
    }
</style>

<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/" class="navbar-brand">Компьютерный клуб</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/home">Главная</a></li>
                    <li><a href="/about">О клубе</a></li>
                    <li><a href="/contact">Контакты</a></li>
                </ul>
            </div>
        </div>
    </div>

        <div class="container body-content">
        <h1>Наши контакты</h1>
            <div class="contacts-container">
        <!-- Карточка 1 (изображение) -->
        <div class="contact-card card1">
            <div class="contact-content">
                <h3 class="contact-name">Карих Даниил</h3>
                <p class="contact-info">📞 +7 (981) 124-24-15</p>
                <p class="contact-info">✉️ dkarihk2005@gmail.com</p>
            </div>
        </div>

        <!-- Карточка 2 (GIF) -->
        <div class="contact-card card2">
            <div class="contact-content">
                <h3 class="contact-name">Буравлёв Максим</h3>
                <p class="contact-info">📞 +7 (999) 765-43-21</p>
                <p class="contact-info">✉️ velichayshey@gmail.com</p>
            </div>
        </div>

        <!-- Карточка 3 (изображение) -->
        <div class="contact-card card3">
            <div class="contact-content">
                <h3 class="contact-name">Бао Алдар</h3>
                <p class="contact-info">📞 +7 (950) 100-20-83</p>
                <p class="contact-info">✉️ baoaldar@gmail.com</p>
            </div>
        </div>
    </div>
        <hr />
        <footer>
            <p>&copy; {{ year }} - Компьютерный клуб "GameOver"</p>
        </footer>
    </div>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
    <script src="/static/scripts/respond.js"></script>

</body>
</html>