# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Signed Cookie-Based HTTP sessions for ASGI applications"
HOMEPAGE="https://github.com/klen/asgi-sessions"
SRC_URI="https://github.com/klen/asgi-sessions/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="fernet jwt"
RESTRICT="test"

RDEPEND="
	>=dev-python/asgi-tools-0.71.0[${PYTHON_USEDEP}]
	fernet? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	jwt? ( dev-python/pyjwt[${PYTHON_USEDEP}] )
"

src_prepare() {
	sed -i 's/^\[project\]/[build-system]\
requires = ["setuptools"]\
build-backend = "setuptools.build_meta"\
\
[project]/' pyproject.toml || die
	distutils-r1_src_prepare
}
