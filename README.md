# elara-fs
- OS
	- Debian 9
- VOIP software
	- Freeswitch version 1.8
- SQL Server software
	- PostgreSQL version 9
- Using Flask with packages
	- flask-login
	- flask-principle
	- flask-debug-toolbar
	- flask-migrate
	- flask-SQLAlchemy
# [Flask Structure](http://exploreflask.com/en/latest/configuration.html)
- All of the blueprints are applied to the Flask() app in the top-level `app/__init__.py`
- We can define the prefix in one of two places
	- When we instantiate the Blueprint() class `app/views/cdr.py`
	- When we register it with app.register_blueprint().
- How to register blueprint with flask
```
	# facebook/__init__.py

	from flask import Flask
	from app.views.cdr import cdr

	app = Flask(__name__)
	app.register_blueprint(cdr, url_prefix='/<user_url_slug>')
```
- Flask configure files and folders using [Blueprint Functional Structure](http://exploreflask.com/en/latest/blueprints.html#functional-structure)
	- example
	```
		project
		├── app
		│   ├── forms
		│   │   └── user.py
		│   ├── __init__.py
		│   ├── models
		│   │   ├── callcenter_model.py
		│   │   ├── cdr_model.py
		│   │   ├── __init__.py
		│   │   ├── sip_account_model.py
		│   │   └── sip_trunk_model.py
		│   ├── static
		│   │   ├── css
		│   │   ├── images
		│   │   └── js
		│   ├── templates
		│   │   ├── base.html
		│   │   ├── callcenter
		│   │   ├── cdr
		│   │   ├── dashboard
		│   │   ├── errors
		│   │   ├── macro.html
		│   │   ├── sip_accounts
		│   │   └── sip_trunks
		│   └── views
		│       ├── callcenter.py
		│       ├── cdr.py
		│       ├── dashboard.py
		│       ├── errors.py
		│       ├── __init__.py
		│       ├── sip_accounts.py
		│       └── sip_trunks.py
		├── config.py
		├── flask-structure-script.sh
		├── instance
		│   └── config.py
		├── requirement.txt
		├── run.py
		└── utils
			└── helpers.py
	```
# Flask Configuration Guide
- `instance` folder can help us hide secret configuration values
- Load the configuration from the instance folder
- For simple project
```
	app = Flask(__name__, instance_relative_config=True)
	# Load the default configuration
	app.config.from_object('config')

	# Load the configuration from the instance folder
	app.config.from_pyfile('config.py')
```
- Configuring based on environment variables => should not be used in simple project
```
	app = Flask(__name__, instance_relative_config=True)
	# Load the default configuration
	app.config.from_object('config.default')

	# Load the configuration from the instance folder
	app.config.from_pyfile('config.py')

	# Load the file specified by the APP_CONFIG_FILE environment variable
	# Variables defined here will override those in the default configuration
	# export APP_CONFIG_FILE=/chym/config/production.py
	app.config.from_envvar('APP_CONFIG_FILE')
```
# Flask command line

- `flask --help`
```
  Usage: flask [OPTIONS] COMMAND [ARGS]...


  A general utility script for Flask applications.

  Provides commands from Flask, extensions, and the application. Loads the
  application defined in the FLASK_APP environment variable, or from a
  wsgi.py file. Setting the FLASK_ENV environment variable to 'development'
  will enable debug mode.

    $ export FLASK_APP=run.py
    $ export FLASK_ENV=development
    $ flask run

Options:
  --version  Show the flask version
  --help     Show this message and exit.

Commands:
  routes  Show the routes for the app.
  run     Runs a development server.
  shell   Runs a shell in the app context.
```
- Using flask run should be export enviroment variables
	+ FLASK_APP
		- run.py
	+ FLASK_ENV
		- production
		- development
	+ flask run
- Using python run.py
	+ using config.py file
	+ python run.py
