# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="Cap'n Proto serialization/RPC system - Python bindings"
HOMEPAGE="https://github.com/capnproto/pycapnp"
SRC_URI="https://github.com/capnproto/pycapnp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/capnproto
"
RDEPEND="${DEPEND}
	dev-python/cython
	dev-python/jinja
"
