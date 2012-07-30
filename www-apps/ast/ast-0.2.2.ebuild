# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit webapp

DESCRIPTION="A web-based portfolio tracker, charting and stock analysis tool"
HOMEPAGE="http://ast.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${PN}-src-${PV}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE="sql"
DEPEND="dev-libs/ta-lib
	app-crypt/mhash
	sci-visualization/gnuplot
	net-www/apache
	dev-libs/libxml2
	net-misc/curl
	sys-libs/zlib
	virtual/libc
	media-libs/gd
	sql? ( dev-db/unixODBC )
	app-admin/pwgen"
REDPEND=""
S=${WORKDIR}/${P}/src

src_compile()
{
	econf $(use_with sql) || die "econf failed"
	emake || die "emake failed"
}

src_install()
{
	webapp_src_preinst

	mkdir -p ${D}/${MY_HTDOCSDIR} || die
	cp ${S}/src/ast ${D}/${MY_HTDOCSDIR} || die
	cp -R ${S}/../var ${D}${MY_HTDOCSDIR} || die
	cp -R ${S}/../share ${D}${MY_HTDOCSDIR} || die
	cp -R ${S}/../images ${D}${MY_HTDOCSDIR} || die
	cp -R ${S}/../etc ${D}${MY_HTDOCSDIR} || die
	keepdir ${MY_HTDOCSDIR}/etc
	cd ${D}/${MY_HTDOCSDIR} || die

	chmod 6700 ast || die
	webapp_serverowned ${MY_HTDOCSDIR}
	webapp_serverowned -R ${MY_HTDOCSDIR}/*

	webapp_postinst_txt en ${FILESDIR}/postinstall.txt || die
	webapp_src_install
}
