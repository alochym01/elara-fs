from flask import Flask

app = Flask(__name__, instance_relative_config=True)

def create_app():

    app.config.from_object("config")

    # load config from instance folder
    app.config.from_pyfile("config.py")

    from app.views.cdr import cdr

    app.register_blueprint(cdr)

    return app