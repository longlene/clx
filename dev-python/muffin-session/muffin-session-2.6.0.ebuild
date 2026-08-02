# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Cookie-based HTTP sessions for the Muffin framework"
HOMEPAGE="https://github.com/klen/muffin-session https://pypi.org/project/muffin-session/"
SRC_URI="https://github.com/klen/muffin-session/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/asgi-sessions[${PYTHON_USEDEP}]
	dev-python/muffin[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/poetry-core[${PYTHON_USEDEP}]
"
