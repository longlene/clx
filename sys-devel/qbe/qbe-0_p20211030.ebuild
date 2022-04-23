# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="4420727667b915042050b9bfa6eb381ce7a97ba5"

DESCRIPTION="Compiler Backend"
HOMEPAGE="https://c9x.me/compile/"
SRC_URI="https://github.com/michaelforney/qbe/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
