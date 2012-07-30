# Copyright 2007 Milton Yates <milton.yates@loule.info>
# Distributed under the terms of the GNU General Public License v2

inherit eutils

REVNUM="b3051.g3051"
DESCRIPTION="LibAXL: Another XML library"
HOMEPAGE="http://xml.aspl.es"
SRC_URI="mirror://sourceforge/vortexlibrary/axl-${PV}.${REVNUM}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"

# doc   : include documentation
# test  : compile and install performance tests
IUSE="doc test log"

RDEPEND=""

DEPEND="${RDEPEND}
	sys-devel/libtool
	dev-util/pkgconfig
	doc? ( app-doc/doxygen )"

src_unpack() {
	unpack ${A}
	mv ${WORKDIR}/axl-${PV}.${REVNUM} ${WORKDIR}/${P}
	cd ${S}
}

src_compile() {
	econf \
		$(use_enable doc axl-doc) \
		$(use_enable log axl-log) \
		$(use_enable test axl-test) \
		|| die "configure failed"

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR=${D} install || die
	dodoc README COPYING INSTALL NEWS AUTHORS ChangeLog VERSION
	use doc && dohtml doc/html/*
}

