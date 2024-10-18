# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Smart Python Agent Development Environment"
HOMEPAGE="https://github.com/javipalanca/spade"
SRC_URI="https://github.com/javipalanca/spade/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/multidict-5.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-modules-0.2.8[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.4.8[${PYTHON_USEDEP}]
	>=dev-python/aioxmpp-0.13.3[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.5[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-jinja2-1.6[${PYTHON_USEDEP}]
	>=dev-python/jinja-3.0.3[${PYTHON_USEDEP}]
	>=dev-python/jinja2-time-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/timeago-1.0.16[${PYTHON_USEDEP}]
	>=dev-python/singletonify-0.2.4[${PYTHON_USEDEP}]
	>=dev-python/pytz-2022.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
