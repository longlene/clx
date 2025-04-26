# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="5ae3b3f17efe50fc1dc103360eeaedc7679448f3"

DESCRIPTION="Privacy-respecting, hackable metasearch engine"
HOMEPAGE="
	https://searxng.org/
	https://github.com/searxng/searxng
"
SRC_URI="https://github.com/searxng/searxng/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/certifi-2020.12.05[${PYTHON_USEDEP}]
	>=dev-python/babel-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/flask-babel-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/flask-1.1.2[${PYTHON_USEDEP}]
	>=dev-python/idna-2.10[${PYTHON_USEDEP}]
	>=dev-python/jinja2-2.11.3[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.6.3[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
	>=dev-python/langdetect-1.0.8[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
