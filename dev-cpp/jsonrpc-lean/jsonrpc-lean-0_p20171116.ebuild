# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="534a9cd0280c3158f3d10abb9f5876bf01c9261e"

DESCRIPTION="Lightweight, fast, transport-agnostic, c++11 implementation of the JSON-RPC 2.0 specification"
HOMEPAGE="https://github.com/uskr/jsonrpc-lean"
SRC_URI="https://github.com/uskr/jsonrpc-lean/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/rapidjson
"

src_install() {
	insinto /usr/include
	doins -r include/jsonrpc-lean
	dodoc README.md
}
