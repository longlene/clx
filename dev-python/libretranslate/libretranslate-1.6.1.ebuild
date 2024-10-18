# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Free and Open Source Machine Translation API"
HOMEPAGE="https://libretranslate.com"
SRC_URI="https://github.com/LibreTranslate/LibreTranslate/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-libs/argos-translate-1.9.6[${PYTHON_USEDEP}]
	>=dev-python/flask-2.2.5[${PYTHON_USEDEP}]
	>=dev-python/flask-swagger-0.2.14[${PYTHON_USEDEP}]
	>=dev-python/flask-swagger-ui-4.11.1[${PYTHON_USEDEP}]
	>=dev-python/flask-limiter-2.6.3[${PYTHON_USEDEP}]
	>=dev-python/flask-babel-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/flask-session-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/waitress-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/expiringdict-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/langdetect-1.0.9[${PYTHON_USEDEP}]
	>=dev-python/lexilang-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/morfessor-2.0.6[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/APScheduler-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/translatehtml-1.5.2[${PYTHON_USEDEP}]
	>=dev-python/argos-translate-files-1.1.4[${PYTHON_USEDEP}]
	>=dev-python/itsdangerous-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-2.3.8[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/redis-4.4.4[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/prometheus-client-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/polib-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	>=sci-libs/pytorch-2.0.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( dev-python/pytest-runner[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

S="${WORKDIR}"/libretranslate-${PV}
