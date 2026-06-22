# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# frappe vendors a custom PyPika fork with extended SQL dialect support;
# no portage package exists for it
MY_PYPIKA_COMMIT="2c50e6142b2d61d2d243e466fdd5dc03b3d918f2"
MY_GUNICORN_COMMIT="bb554053bb87218120d76ab6676af7015680e8b6"

DESCRIPTION="Metadata driven, full-stack low code web framework"
HOMEPAGE="https://frappe.io/framework https://github.com/frappe/frappe"
SRC_URI="
	https://github.com/frappe/frappe/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/frappe/pypika/archive/${MY_PYPIKA_COMMIT}.tar.gz
		-> frappe-pypika-${MY_PYPIKA_COMMIT:0:8}.gh.tar.gz
	https://github.com/frappe/gunicorn/archive/${MY_GUNICORN_COMMIT}.tar.gz
		-> frappe-gunicorn-${MY_GUNICORN_COMMIT:0:8}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/babel-2.16.0[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.13.5[${PYTHON_USEDEP}]
	>=dev-python/bleach-6.3.0[${PYTHON_USEDEP}]
	>=dev-python/chardet-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.3.1[${PYTHON_USEDEP}]
	>=dev-python/croniter-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-46.0.3[${PYTHON_USEDEP}]
	>=dev-python/cssutils-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.20.1[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/gitpython-3.1.45[${PYTHON_USEDEP}]
	>=dev-python/google-api-python-client-2.188.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.48.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-oauthlib-1.2.4[${PYTHON_USEDEP}]
	>=dev-python/hiredis-3.3.0[${PYTHON_USEDEP}]
	>=dev-python/html5lib-1.1[${PYTHON_USEDEP}]
	>=dev-python/ipython-8.37.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
	>=dev-python/ldap3-2.9.1[${PYTHON_USEDEP}]
	>=dev-python/markdown2-2.5.4[${PYTHON_USEDEP}]
	>=dev-python/markdownify-0.11.6[${PYTHON_USEDEP}]
	>=dev-python/markupsafe-3.0.3[${PYTHON_USEDEP}]
	>=dev-python/mysqlclient-2.2.7[${PYTHON_USEDEP}]
	>=dev-python/nh3-0.3.2[${PYTHON_USEDEP}]
	>=dev-python/num2words-0.5.14[${PYTHON_USEDEP}]
	>=dev-python/oauthlib-3.3.1[${PYTHON_USEDEP}]
	>=dev-python/openpyxl-3.1.5[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.11.5[${PYTHON_USEDEP}]
	>=dev-python/passlib-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/phonenumbers-9.0.21[${PYTHON_USEDEP}]
	>=dev-python/pillow-12.2.0[${PYTHON_USEDEP}]
	>=dev-python/posthog-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/psycopg-2.9.11[${PYTHON_USEDEP}]
	>=dev-python/pycountry-24.6.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
	>=dev-python/pydyf-0.12.1[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.12.1[${PYTHON_USEDEP}]
	>=dev-python/pymysql-1.1.2[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-26.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pypdf-6.10.2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2025.2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
	>=dev-python/redis-7.1.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.33.0[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/rq-2.6.1[${PYTHON_USEDEP}]
	>=dev-python/rsa-4.9.1[${PYTHON_USEDEP}]
	>=dev-python/semantic-version-2.10.0[${PYTHON_USEDEP}]
	>=dev-python/sentry-sdk-1.45.1[${PYTHON_USEDEP}]
	>=dev-python/sqlparse-0.5.5[${PYTHON_USEDEP}]
	>=dev-python/tenacity-9.1.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
	>=dev-python/vobject-0.9.8[${PYTHON_USEDEP}]
	>=dev-python/weasyprint-68.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-3.1.6[${PYTHON_USEDEP}]
	>=dev-python/whoosh-2.7.4[${PYTHON_USEDEP}]
	>=dev-python/xlrd-2.0.2[${PYTHON_USEDEP}]
	>=dev-python/xlsxwriter-3.2.9[${PYTHON_USEDEP}]
	>=dev-python/zxcvbn-4.5.0[${PYTHON_USEDEP}]
	dev-python/bleach-allowlist[${PYTHON_USEDEP}]
	dev-python/email-reply-parser[${PYTHON_USEDEP}]
	dev-python/pdfkit[${PYTHON_USEDEP}]
	dev-python/premailer[${PYTHON_USEDEP}]
	dev-python/pyqrcode[${PYTHON_USEDEP}]
	dev-python/rauth[${PYTHON_USEDEP}]
	dev-python/restrictedpython[${PYTHON_USEDEP}]
	dev-python/sql-metadata[${PYTHON_USEDEP}]
	dev-python/terminaltables[${PYTHON_USEDEP}]
	dev-python/traceback-with-variables[${PYTHON_USEDEP}]
')
>=www-servers/gunicorn-22.0"

python_install() {
	distutils-r1_python_install
	# Install frappe's custom PyPika fork (extends upstream with MariaDB/Frappe dialects)
	python_domodule \
		"${WORKDIR}/pypika-${MY_PYPIKA_COMMIT}/pypika"
	# Install frappe's gunicorn fork (adds frappe-specific async worker support)
	python_domodule \
		"${WORKDIR}/gunicorn-${MY_GUNICORN_COMMIT}/gunicorn"
}
