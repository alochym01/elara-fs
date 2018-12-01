# elara-fs
- OS
	- Debian 9
- VOIP software
	- Freeswitch version 1.8
- SQL Server software
	- PostgreSQL version 9
- Using Flask with packages
	- flask-security
	- flask-debug-toolbar
	- flask-migrate
	- flask-SQLAlchemy
# [Flask Structure](http://exploreflask.com/en/latest/configuration.html)
- Flask configure files and folders using [Blueprint Functional Structure](http://exploreflask.com/en/latest/blueprints.html#functional-structure)
```
	project
	├── app
	│   ├── callcenter_model.py
	│   ├── cdr_model.py
	│   ├── __init__.py
	│   ├── sip_account_model.py
	│   ├── sip_trunk_model.py
	│   ├── static
	│   │   ├── css
	│   │   └── images
	│   ├── templates
	│   │   ├── base.html
	│   │   ├── callcenter
	│   │   ├── cdr
	│   │   ├── dashboard
	│   │   ├── sip_accounts
	│   │   └── sip_trunks
	│   └── views
	│       ├── callcenter.py
	│       ├── cdr.py
	│       ├── dashboard.py
	│       ├── sip_accounts.py
	│       └── sip_trunks.py
	├── config					# Configuring based on environment variables
	│   ├── default.py
	│   ├── development.py
	│   ├── __init__.py
	│   ├── production.py
	│   └── staging.py
	├── instance
	│   └── config.py
	├── config.py					# for using in simple project
	├── requirements.txt
	└── run.py


	# Choose simple project structure or based on environment variable structure project


	# config/default.py
		Default values, to be used for all environments or overridden by individual environments.
		An example
			setting DEBUG = False in config/default.py
			setting DEBUG = True in config/development.py.
	# config/development.py
		Values to be used during development.
		You might specify the URI of a database sitting on localhost.
	# config/production.py
		Values to be used in production.
		You might specify the URI for your database server, as opposed to the localhost database URI used for development.
```
# Flask Configuration Guide
- `instance` folder can help us hide secret configuration values
- Load the configuration from the instance folder
- For simple project
```
	app = Flask(__name__, instance_relative_config=True)
	# Load the default configuration
	app.config.from_object('config.py')

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
