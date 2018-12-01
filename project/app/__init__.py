from flask import Flask
from .views.cdr import cdr

app = Flask(__name__)

app.register_blueprint(cdr)