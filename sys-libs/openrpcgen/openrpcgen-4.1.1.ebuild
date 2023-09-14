# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Port of OpenBSD rpcgen compiler for uclibc"
HOMEPAGE="http://dev.alpinelinux.org/openrpcgen"
SRC_URI="http://dev.alpinelinux.org/openrpcgen/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="!sys-libs/glibc"
RDEPEND="${DEPEND}"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	insinto /usr/share/man/man1
	doins rpcgen.1
}
