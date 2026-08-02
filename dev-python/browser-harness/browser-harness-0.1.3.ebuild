# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Self-healing harness that enables LLMs to complete any task in a browser"
HOMEPAGE="https://github.com/browser-use/browser-harness"
SRC_URI="https://github.com/browser-use/browser-harness/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/cdp-use[${PYTHON_USEDEP}]
	dev-python/fetch-use[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
"
