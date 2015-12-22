# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 autotools

DESCRIPTION="JSON-RPC in C"
HOMEPAGE="https://github.com/hmng/jsonrpc-c"
SRC_URI=""

EGIT_REPO_URI="https://github.com/hmng/jsonrpc-c.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	dev-libs/libev
"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
