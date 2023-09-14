# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

MY_PN=msrc
MY_PV=4.20
MY_P=${MY_PN}-${MY_PV}
S=${WORKDIR}/${MY_P}/local

DESCRIPTION="Front-end for rdist(1) that preprocesses files with m4"
HOMEPAGE="http://www.npcguild.org/software/pundits/"
SRC_URI="${HOMEPAGE}${MY_P}.tgz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="net-misc/rdist
	sys-devel/m4"
DEPEND="${RDEPEND}
	dev-util/mkcmd
	dev-util/msrc0"

src_unpack() {
	unpack ${A} && cd ${S} || die
	epatch ${FILESDIR}/*.patch
}

src_compile() {
	cd etc/${PN}
	makeme || die "make failed"
}

src_install() {
	cd etc/${PN}
	dodir /usr/bin
	makeme DESTDIR=${D} install
	ln distrib.man distrib.8 && doman distrib.8
	dodoc INSTALL README
	cd ../../lib/${PN}
	makeme DESTDIR=${D} install
	ln distrib.cf.man distrib.cf.5 && doman distrib.cf.5
	dodoc README *.cf *.defs
}
