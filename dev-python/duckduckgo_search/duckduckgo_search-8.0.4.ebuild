# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Search for text, news, images and videos using the DuckDuckGo.com search engine"
HOMEPAGE="
	https://pypi.org/project/duckduckgo_search/
	https://github.com/deedy5/duckduckgo_search
"
SRC_URI="https://github.com/deedy5/duckduckgo_search/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/click-8.1.8[${PYTHON_USEDEP}]
	>=dev-python/primp-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-5.3.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
