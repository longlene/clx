# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Fuse-based httpfs file system"
HOMEPAGE="http://httpfs.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/httpfs_with_static_binaries_${PV}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"

IUSE=""

RDEPEND="sys-fs/fuse"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	# The script doesn't accept custom CFLAGS. Fix it.
	sed -i \
		-e 's:^gcc -c -O2 -g -Wall \(.*\)$:gcc -c ${CFLAGS} \1:' \
		-e 's:^gcc -s \(.*\):gcc ${CFLAGS} \1:' \
		make_httpfs || die "sed make_httpfs failed"
}

src_compile() {
	./make_httpfs || die "make_httpfs failed"
}

src_install() {
	dobin httpfs
	dodoc readme.2
}
