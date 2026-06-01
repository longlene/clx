# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A modern, enterprise-ready business intelligence web application"
HOMEPAGE="
	https://github.com/apache/superset/
	https://pypi.org/project/superset/
"
SRC_URI="https://github.com/apache/superset/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/backoff-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/celery-5.3.6[${PYTHON_USEDEP}]
	>=dev-python/click-8.0.3[${PYTHON_USEDEP}]
	>=dev-python/click-option-group-0.5.6[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/flask-cors-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/croniter-0.3.28[${PYTHON_USEDEP}]
	dev-python/cron-descriptor[${PYTHON_USEDEP}]
	>=dev-python/cryptography-42.0.4[${PYTHON_USEDEP}]
	>=dev-python/deprecation-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/flask-2.2.5[${PYTHON_USEDEP}]
	>=dev-python/flask-appbuilder-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-caching-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/flask-compress-1.13[${PYTHON_USEDEP}]
	>=dev-python/flask-talisman-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-login-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/flask-migrate-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/flask-session-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/flask-wtf-1.1.0[${PYTHON_USEDEP}]
	sci-geosciences/geopy[${PYTHON_USEDEP}]
	>=dev-python/greenlet-3.0.3[${PYTHON_USEDEP}]
	>=www-servers/gunicorn-22.0.0[${PYTHON_USEDEP}]
	>=dev-python/hashids-1.3.1[${PYTHON_USEDEP}]
	>=dev-python/holidays-0.45[${PYTHON_USEDEP}]
	>=dev-python/humanize-4.9.0[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/jsonpath-ng-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/mako-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.0[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.0[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/nh3-0.2.11[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.23.5[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.1.4[${PYTHON_USEDEP}]
	>=dev-python/bottleneck-1.3.8[${PYTHON_USEDEP}]
	>=dev-python/parsedatetime-2.6[${PYTHON_USEDEP}]
	>=dev-python/paramiko-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/pgsanity-0.2.9[${PYTHON_USEDEP}]
	>=dev-python/pillow-11.0.0[${PYTHON_USEDEP}]
	>=dev-python/polyline-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-3.0.6[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/python-geohash-0.8.5[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-16.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/redis-4.6.0[${PYTHON_USEDEP}]
	>=dev-python/selenium-4.14.0[${PYTHON_USEDEP}]
	>=dev-python/shillelagh-1.4.3[${PYTHON_USEDEP}]
	>=dev-python/sshtunnel-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/simplejson-3.15.0[${PYTHON_USEDEP}]
	>=dev-python/slack_sdk-3.19.0[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-1.4.52[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-utils-0.38.3[${PYTHON_USEDEP}]
	>=dev-python/sqlglot-27.15.2[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.0[${PYTHON_USEDEP}]
	>=dev-python/wtforms-2.3.3[${PYTHON_USEDEP}]
	>=dev-python/wtforms-json-0.3.5[${PYTHON_USEDEP}]
	>=dev-python/xlsxwriter-3.0.7[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

src_prepare() {
	default
	rm -rf tests
	distutils-r1_src_prepare
}
