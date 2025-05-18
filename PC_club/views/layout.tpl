
<style>
    .logo-img {
        width: 25px;
        height: auto;
        border-radius: 5px;
    }




    

</style>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - My Bottle Application</title>
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/about.css"/>
    <link rel="stylesheet" type="text/css" href="/static/content/partners.css"
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
</head>

<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/" class="navbar-brand">
                    <img class="logo-img" src = "/static/images/logo.jpg"/>
                </a>
            </div>
            <div class="navbar-collapse collapse nav-style" >
                <ul class="nav navbar-nav navbar">
                    <li><a href="/home">Главная</a></li>
                    <li><a href="/about">О клубе</a></li>
                    <li><a href="/partners">Партнеры</a></li>
                    <li><a href="/articles">Полезные статьи</a><li>
                    <li><a href="/contact">Контакты</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container body-content">
        {{!base}}
        <hr />
        <footer>
            <p>&copy; {{ year }} - Компьютерный клуб "Cyber Nexus"</p>
        </footer>
    </div>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
    <script src="/static/scripts/respond.js"></script>

</body>
</html>
