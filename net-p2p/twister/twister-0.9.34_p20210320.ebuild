# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="323314ebf3e08bb2dd3e307e664a4ec055fa9dcc"

DESCRIPTION="Peer-to-peer microblogging"
HOMEPAGE="http://twister.net.co/"
SRC_URI="https://github.com/miguelfreitas/twister-core/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/openssl:*[-bindist]
	sys-libs/db
	dev-libs/boost
	net-libs/miniupnpc
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./bootstrap.sh CPPFLAGS="-fpermissive"
}

src_compile() {
	emake
}

src_install() {
	einstall

	rm -f "${D}/usr/share/applications/mimeinfo.cache"
	use tk || rm -fr "${D}/usr/share/pixmaps"
	use tk || rm -f "${D}/usr/bin/twister-control"
	use tk || rm -fr "${D}/usr/share/applications"

	exeinto "/usr/bin/"
	doexe "${FILESDIR}/twister-html-install"
	doexe "${FILESDIR}/twister-html-update"
}

pkg_postinst() {
	elog "Befor running twister, each user must set up twister's HTML files"
	elog "in ~/.twister/html and the configs in ~/.twister/twister.conf."
	elog "They can do this by running twister-html-install."
	elog ""
	elog "To keep the HTML files up to date, run twister-html-update."
}
