# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Velleman K8048 kit programmer for UNIX"
HOMEPAGE="http://dev.kewl.org/k8048"
SRC_URI="http://dev.kewl.org/${PN}/${PN}.tar.gz"
RESTRICT="nomirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-embedded/gputils
        sys-libs/readline
        sys-libs/ncurses"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	epatch "${FILESDIR}/${PN}-nocvs.patch" || die
}

src_compile() {
	cd ${S}
	emake all || die
}

src_install() {
	insinto "/usr/bin"
	dobin "${S}/${PN}/${PN}"
	dosym "/usr/bin/${PN}" "/usr/bin/k14"
	dosym "/usr/bin/${PN}" "/usr/bin/k16"
	dosym "/usr/bin/${PN}" "/usr/bin/kdebug"
	dosym "/usr/bin/${PN}" "/usr/bin/ktest"

	dodoc LICENSE
	dodoc "${S}/${PN}/README.txt"

	dodoc "${S}/${PN}/velleman/demo"[1-3]".asm"
	dodoc "${S}/${PN}/velleman/demo"[1-3]".hex"

	dohtml "${S}/Doc/index.html"
	docinto "Images"
	insinto "/usr/share/doc/${P}/Images"
	doins "${S}/Images/"*.jpg
}

pkg_postinst() {
	elog "Don't forgot to add users in the uucp group"
	elog "for serial interface access ( /dev/ttyS0 )"
}
