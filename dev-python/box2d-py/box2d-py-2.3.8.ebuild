# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="Python Box2D"
HOMEPAGE="https://github.com/openai/box2d-py"
SRC_URI="https://github.com/openai/box2d-py/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/swig"
