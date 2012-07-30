# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Gepolabo is a bourse analyser"
HOMEPAGE="http://gepolabo.free.fr"
SRC_URI="http://gepolabo.free.fr/telechargement/v${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="nls"

DEPEND=">=dev-db/mysql-3.23
	x11-libs/gtk+
	net-misc/curl
	nls? (sys-devel/gettext)"
RDEPEND="${DEPEND}"

RESTRICT="nomirror"

src_unpack()
{
	unpack ${A}
}

src_compile()
{
	econf \
		`use_enable nls` || die
	emake || die
}

src_install()
{
	dodir /usr/bin
	
	# For fixing the Makefile which need those directory, but don't create them
	dodir /usr/share/gepolabo/sql
	dodir /usr/share/gepolabo/web/{histo,seance}

	einstall || die

	# Files created are in a nasty directory (don't find how delete them
	# properly (with ./configure), so ...
	rm -rf ${D}/usr/doc
	
	dodoc README AUTHORS TODO NEWS ChangeLog
}

pkg_postinst()
{
	einfo "Gepolabo is now installed"
	einfo "You just have now to use to the sql script which is placed on /usr/share/gepolabo/sql/creation.sql"
	einfo "Also, you can see files in /usr/share/gepolabo/"
}
