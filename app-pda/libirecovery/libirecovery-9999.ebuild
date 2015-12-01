# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

DESCRIPTION="iRecovery is a libusb-based commandline utility to talk to iBoot/iBSS in Apple's iPhone/iPod touch via USB"
HOMEPAGE="http://github.com/chronicdev/libirecovery.git"
EGIT_REPO_URI="git://github.com/chronicdev/libirecovery.git"
EGIT_PROJECT="libirecovery"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/libusb:1
        sys-libs/readline"
RDEPEND="${DEPEND}"

src_compile() {
	emake linux
}

src_install() {
	dobin "irecovery"
	dolib "libirecovery.so"
	dodoc "LICENSE" "README" "TODO"
}
