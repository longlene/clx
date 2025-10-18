# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Errbot is a chatbot designed to be simple to extend with plugins written in Python"
HOMEPAGE="
	https://pypi.org/project/errbot/
	https://github.com/errbotio/errbot/
"
SRC_URI="https://github.com/errbotio/errbot/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/webtest-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-78.1.1[${PYTHON_USEDEP}]
	>=dev-python/flask-2.3.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24.3.0[${PYTHON_USEDEP}]
	>=dev-python/colorlog-6.7.0[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.4.4[${PYTHON_USEDEP}]
	>=dev-python/ansi-0.3.6[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.16.1[${PYTHON_USEDEP}]
	>=dev-python/pygments-markdown-lexer-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/dulwich-0.21.5[${PYTHON_USEDEP}]
	>=dev-python/deepmerge-1.1.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
