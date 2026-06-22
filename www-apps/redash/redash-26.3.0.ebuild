# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Make Your Company Data Driven. Connect to any data source and visualize"
HOMEPAGE="https://redash.io/ https://github.com/getredash/redash"
SRC_URI="https://github.com/getredash/redash/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ldap"
RESTRICT="test"

# Dependencies not yet packaged in portage (needed before this can be installed):
#   dev-python/advocate           (SSRF-safe HTTP requests)
#   dev-python/disposable-email-domains
#   dev-python/flask-migrate
#   dev-python/flask-restful
#   dev-python/flask-sqlalchemy
#   dev-python/gevent             (required by gunicorn async workers)
#   dev-python/maxminddb-geolite2
#   dev-python/psycopg2           (PostgreSQL driver)
#   dev-python/pypd               (PagerDuty)
#   dev-python/pysaml2
#   dev-python/restrictedpython
#   dev-python/rq-scheduler
#   dev-python/sqlalchemy-searchable
#   dev-python/supervisor
#   dev-python/supervisor-checks
#   dev-python/ua-parser
#   dev-python/user-agents
#   dev-python/pyodbc

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/aniso8601[${PYTHON_USEDEP}]
		dev-python/authlib[${PYTHON_USEDEP}]
		dev-python/backoff[${PYTHON_USEDEP}]
		dev-python/blinker[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/debugpy[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/flask-limiter[${PYTHON_USEDEP}]
		dev-python/flask-login[${PYTHON_USEDEP}]
		dev-python/flask-mail[${PYTHON_USEDEP}]
		dev-python/flask-talisman[${PYTHON_USEDEP}]
		dev-python/flask-wtf[${PYTHON_USEDEP}]
		dev-python/funcy[${PYTHON_USEDEP}]
		dev-python/greenlet[${PYTHON_USEDEP}]
		www-servers/gunicorn[${PYTHON_USEDEP}]
		dev-python/httplib2[${PYTHON_USEDEP}]
		dev-python/itsdangerous[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		dev-python/markupsafe[${PYTHON_USEDEP}]
		dev-python/paramiko[${PYTHON_USEDEP}]
		dev-python/parsedatetime[${PYTHON_USEDEP}]
		dev-python/passlib[${PYTHON_USEDEP}]
		dev-python/pyasynchat[${PYTHON_USEDEP}]
		dev-python/pyjwt[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/pystache[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/redis[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/rq[${PYTHON_USEDEP}]
		dev-python/semver[${PYTHON_USEDEP}]
		dev-python/sentry-sdk[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-1.3.24[${PYTHON_USEDEP}]
		dev-python/sqlalchemy-utils[${PYTHON_USEDEP}]
		dev-python/sqlparse[${PYTHON_USEDEP}]
		dev-python/sshtunnel[${PYTHON_USEDEP}]
		dev-python/statsd[${PYTHON_USEDEP}]
		dev-python/tzlocal[${PYTHON_USEDEP}]
		dev-python/urllib3[${PYTHON_USEDEP}]
		dev-python/werkzeug[${PYTHON_USEDEP}]
		dev-python/wtforms[${PYTHON_USEDEP}]
		dev-python/xlsxwriter[${PYTHON_USEDEP}]
		ldap? ( dev-python/ldap3[${PYTHON_USEDEP}] )
	')
"
