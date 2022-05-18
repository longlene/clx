# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="2caa26e388b1c904d2f12fb09f84df7e761d8331"

DESCRIPTION="Compiler Backend"
HOMEPAGE="https://c9x.me/compile/"
SRC_URI="https://c9x.me/git/qbe.git/snapshot/qbe-${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin obj/qbe
	dodoc README
}
