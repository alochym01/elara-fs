from flask import Blueprint, render_template

cdr = Blueprint('cdr', __name__)

@cdr.route('/cdr')
def index():
    return "CDR index page"
