# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs flag-o-matic

DESCRIPTION="Fuse-based httpfs file system"
HOMEPAGE="http://httpfs.sourceforge.net/"
SRC_URI="mirror://sourceforge/httpfs/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

IUSE="doc ssl"

DEPEND="
	sys-fs/fuse
	doc? ( app-text/asciidoc )
	ssl? ( net-libs/gnutls )
"

src_compile() {
	append-cflags $(pkg-config --cflags fuse)
	append-cppflags -Wno-unused-function -Wtype-limits -DUSE_AUTH -D_XOPEN_SOURCE=700 -D_ISOC99_SOURCE -DUSE_THREAD
	append-libs pthread fuse
	if use ssl ; then
		append-cppflags -DUSE_SSL $(pkg-config --cflags gnutls) -DCERT_STORE=\"/etc/ssl/certs/ca-certificates.crt\"
		append-libs $(pkg-config --libs gnutls)
	fi
	$(tc-getCC) -o ${PN} ${CPPFLAGS} ${CFLAGS} ${LIBS} httpfs2.c
	use doc && a2x -f manpage httpfs2.1.txt
}

src_install() {
	dobin httpfs2
	use doc && doman httpfs2.1
}
