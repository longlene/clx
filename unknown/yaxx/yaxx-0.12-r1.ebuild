# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit eutils flag-o-matic

DESCRIPTION="A yacc extension to xml"
HOMEPAGE="http://yaxx.sourceforge.net"
SRC_URI="mirror://sourceforge/yaxx/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86"
IUSE="nls static"

DEPEND="nls? ( sys-devel/bison )"

RDEPEND=""

src_unpack() {
	unpack ${A}
}

# src_compile() {
# don't do anything
# }

src_install() {
	cp "${S}"/yaxx/bison/share/yaxx-0.12-bison-2.1.c ${ROOT}/usr/share/bison/yaxx.c || die
}

pkg_postinst() {
	if [[ ! -e ${ROOT}/usr/bin/yaxx ]] ; then
	    echo "bison -S yaxx.c $*" > ${ROOT}/usr/bin/yaxx
		chmod +x ${ROOT}/usr/bin/yaxx
	fi
}
