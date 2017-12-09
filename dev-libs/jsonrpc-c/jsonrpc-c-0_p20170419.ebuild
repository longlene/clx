# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools vcs-snapshot

EGIT_COMMIT="2345ac0c7da9d015f2e6e822bc0f637e093f10eb"

DESCRIPTION="JSON-RPC in C"
HOMEPAGE="https://github.com/hmng/jsonrpc-c"
SRC_URI="https://github.com/hmng/jsonrpc-c/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/libev
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
