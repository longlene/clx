# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Plugins for libcdorganizer, including KDS CDM-751 and Dacal DC-300"
HOMEPAGE="http://libcdorganizer.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/libcdorganizer/${P}.tar.bz2"

LICENSE="BSD"
SLOT="3"
KEYWORDS="~x86 ~amd64"
IUSE="kdscdm751 dacaldc300"

DEPEND="=dev-libs/libcdorganizer-3.0*"
RDEPEND=""

src_compile()
{
	local myconf
	if use !kdscdm751 ; then
		myconf="${myconf} --enable-kdscdm751=no"
	fi
	if use !dacaldc300 ; then
		myconf="${myconf} --enable-dacaldc300=no"
	fi
	econf ${myconf} CFLAGS=-I/usr/include/libcdorganizer3 || die "econf failed"
	emake || die "emake failed"
}

src_install()
{
	emake DESTDIR="${D}" install || die "emake install failed"
}
