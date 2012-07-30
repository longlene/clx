# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Utilities for libcdorganizer"
HOMEPAGE="http://libcdorganizer.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/libcdorganizer/${PF}.tar.bz2"

LICENSE="BSD"
SLOT="2.1"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="=dev-libs/libcdorganizer-2.1*"
RDEPEND=""

S=${WORKDIR}/${PF}

src_compile()
{
        econf || die "econf failed"
        emake || die "emake failed"
}

src_install()
{
        emake DESTDIR="${D}" install || die     "emake install failed"
}