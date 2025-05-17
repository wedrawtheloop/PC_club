"""
Routes and views for the bottle application.
"""

#from urllib import request
from bottle import *
from datetime import datetime
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
