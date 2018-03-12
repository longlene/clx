# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="f3463b20d2ff86121a2e0a7e6f6e1886846428ef"

DESCRIPTION="mruby/c is an another implementation of mruby"
HOMEPAGE="https://github.com/mrubyc/mrubyc"
SRC_URI="https://github.com/mrubyc/mrubyc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake -j1
}

src_install() {
	dobin sample_c/${PN}
	dolib.a src/libmrubyc.a
	insinto /usr/include
	doins src/mrubyc.h
	dodoc README.md
}
