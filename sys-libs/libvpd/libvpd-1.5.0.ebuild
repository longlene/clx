# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/libvpd/libvpd/libvpd-x.ebuild,v 1.2 2008/01/09 22:35:49 munsone Exp $

DESCRIPTION="A C++ library for accessing VPD stored by sys-apps/lsvpd."
HOMEPAGE="http://linux-diag.sourceforge.net/Lsvpd.html"
SRC_URI="mirror://sourceforge/linux-diag/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~ppc ~ppc64"
IUSE=""

DEPEND="sys-devel/libtool
	>=sys-libs/db-4.3.29-r2"
RDEPEND=">=sys-libs/libstdc++-v3-3.3.4
	>=sys-libs/zlib-1.2.3"

src_compile()
{
	econf --prefix=/usr/ || die "Configure failed"

	emake || die "Build failed"
}

src_install()
{
	make DESTDIR=${D} install || die "Install failed"
}
