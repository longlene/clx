# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

REVNUM="b4475.g4476"
MY_P="${PN/lib}-${PV}.${REVNUM}"

DESCRIPTION="Another XML library"
HOMEPAGE="http://xml.aspl.es"
SRC_URI="mirror://sourceforge/vortexlibrary/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# doc   : include documentation
# test  : compile and install performance tests
IUSE="doc test"

RDEPEND=""

DEPEND="${RDEPEND}
	sys-devel/libtool
	dev-util/pkgconfig
	doc? ( app-doc/doxygen )"

S="${WORKDIR}/${MY_P}"

src_configure() {
	econf \
		$(use_enable doc axl-doc) \
		$(use_enable test axl-test)
}

src_install() {
	emake DESTDIR=${D} install || die
	dodoc README COPYING INSTALL NEWS AUTHORS ChangeLog
	use doc && dohtml doc/html/*
}

