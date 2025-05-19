"""
Routes and views for the bottle application.
"""

#from urllib import request
from bottle import *
from datetime import datetime
from form_handlers.articleForm import ArticleForm
from form_handlers.patrners_form import PartnerForm

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='О нас',
        message='Добро пожаловать в наш компьютерный клуб!',
        year=datetime.now().year
    )

@route('/partners', method=['GET', 'POST'])
@view('partners')
def partners():
    """Renders the about page."""
    form = PartnerForm()
    
    if request.method == 'POST':
        if form.validate(request):
            form.add_partner()
            return redirect('/partners')
    
    return dict(
        title='Партнерские компании',
        message='Наши партнеры',
        year=datetime.now().year,
        partners=form.get_sorted_partners(),
        errors=form.errors,
        form_data=form.form_data
    )

@route('/articles', method =['GET','POST'])
@view('articles')
def articles():

    article_form = ArticleForm()
    form_data = {}
    if request.method == 'POST':
        new_article = {}

        new_article['author'] = request.forms.getunicode('author').strip()
        new_article['title'] = request.forms.getunicode('title').strip()
        new_article['text'] = request.forms.getunicode('text').strip()
        new_article['phone_number'] = request.forms.getunicode('phone_number').strip()
        new_article['date'] = datetime.now().strftime('%Y-%m-%d')

        form_data['author'] = new_article['author']
        form_data['title'] = new_article['title']
        form_data['text'] = new_article['text']
        form_data['phone_number'] = new_article['phone_number']

        if article_form.is_data_valid(new_article):
            article_form.add_article(new_article)
            return redirect('/articles')

    return dict(
        title = 'Articles',
        year = datetime.now().year,
        articles = article_form.data,
        errors = article_form.errors,
        form_data = form_data
    )
