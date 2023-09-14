# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="90d1f7f199cc55b13c7fdb5839d1409806633fdb"

DESCRIPTION="A small C compiler"
HOMEPAGE="https://github.com/rui314/chibicc"
SRC_URI="https://github.com/rui314/chibicc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin chibicc
	dodoc README.md
}
