# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# Upstream uses 'post' suffix: v5.5.0-post1 → 5.5.0_p1 in Gentoo
MY_PV="${PV/_p/-post}"

DESCRIPTION="A Python binding for the great C library raylib"
HOMEPAGE="https://github.com/overdev/raylib-py"
SRC_URI="https://github.com/overdev/raylib-py/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/raylib-py-${MY_PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-games/raylib
"
