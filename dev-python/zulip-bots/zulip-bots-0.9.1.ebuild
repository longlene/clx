# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="python-zulip-api"

DESCRIPTION="Bindings for the Zulip message API"
HOMEPAGE="
	https://pypi.org/project/zulip-bots/
	https://github.com/zulip/python-zulip-api
"
SRC_URI="https://github.com/zulip/python-zulip-api/archive/refs/tags/${PV}.tar.gz -> ${MY_PN}-${PV}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/zulip[${PYTHON_USEDEP}]
	dev-python/html2text[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/importlib-metadata-3.6.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${MY_PN}-${PV}/zulip_bots
