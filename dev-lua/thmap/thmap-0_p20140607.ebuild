# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="9c9eee5357a9d5c02824c7176972f0a79db0203e"

DESCRIPTION="Trivial distributed computing for Torch"
HOMEPAGE="https://github.com/clementfarabet/thmap"
SRC_URI="https://github.com/clementfarabet/thmap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	sci-misc/trepl
	dev-lua/async
"

src_install() {
	insinto $(lua_get_sharedir)/thmap
	doins -r node
	dobin thnode thmap
	dodoc README.md
}
