# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="e193133e43af0862f51edfb9b518e212ea084412"

DESCRIPTION="A Tiny Garbage Collector for C"
HOMEPAGE="https://github.com/orangeduck/tgc"
SRC_URI="https://github.com/orangeduck/tgc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.so libtgc.so
	insinto /usr/include
	doins tgc.h
	dodoc README.md
}
