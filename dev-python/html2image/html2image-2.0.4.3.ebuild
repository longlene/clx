# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="A wrapper around the headless mode of existing web browsers to generate images from URLs and from HTML+CSS strings or files"
HOMEPAGE="
	https://pypi.org/project/html2image/
"
SRC_URI="https://github.com/vgalin/html2image/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/websocket-client-1.2.3[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pillow-8.2.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
