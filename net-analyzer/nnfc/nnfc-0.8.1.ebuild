# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="New Netflow Collector is aimed to be POSIX-compliant, portable collector of flows."

HOMEPAGE="http://sourceforge.net/projects/nnfc/"
SRC_URI="mirror://sourceforge/nnfc/${PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"

KEYWORDS="~x86"

IUSE="mysql postgres megabit"

DEPEND="postgres? ( >=dev-db/postgresql-7.4 )
	mysql? ( >=dev-db/mysql-4.0 )"

S=${WORKDIR}/${P}

src_compile() {

    econf $(use_with mysql) $(use_with postgres) $(use_with megabit)|| die "econf failed"
    emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die
	dodir /var/run/nnfc /var/lib/nnfc/stats /etc/nnfc
	keepdir /var/lib/nnfc /var/lib/nnfc/stats
	fowners nobody:nogroup /var/run/nnfc /var/lib/nnfc/stats /var/lib/nnfc
	insinto /etc/conf.d/
	doins ${FILESDIR}/${PV}/conf.d/nnfc
	exeinto /etc/init.d/
	doexe ${FILESDIR}/${PV}/init.d/nnfc
	insinto /etc/nnfc/
	doins ${FILESDIR}/${PV}/nnfc.cfg
	dodoc README TODO AUTHORS THANKS ChangeLog 
}

pkg_postinst(){
	einfo ""
	einfo "Sample config & database schema installed in /usr/share/nnfc"
	einfo ""
}
