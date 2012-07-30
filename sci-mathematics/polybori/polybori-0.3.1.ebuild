# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils python

NEED_PYTHON=2.5

MY_PN="PolyBoRi"
DESCRIPTION="Polynomials over Boolean Rings"
HOMEPAGE="http://polybori.sourceforge.net/"
SRC_URI="http://downloads.sourceforge.net/polybori/${MY_PN}-${PV}.tar.gz"

RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64 ~ppc64"
IUSE=""

DEPEND=">=dev-util/scons-0.97
		>=dev-libs/boost-1.34.1
		dev-python/ipython"
RDEPEND=">=dev-libs/boost-1.34.1
		dev-python/ipython"

S="${WORKDIR}/${MY_PN}"

src_compile() {
	cd ${S}
	mkdir -p "${D}"
	scons \
		CFLAGS="${CFLAGS}" \
		CXXFLAGS="${CXXFLAGS}" 

}

src_install() {
	scons PREFIX="${D}/usr" PYINSTALLPREFIX="${D}/usr/lib/python2.5/site-packages" install \
		|| die "scons install failed"

	scons DEVEL_PREFIX="${D}/usr" PYINSTALLPREFIX="${D}/usr/lib/python2.5/site-packages" devel-install \
		|| die "scons devel-install failed"

}

