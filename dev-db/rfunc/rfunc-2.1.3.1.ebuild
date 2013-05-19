# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#

inherit eutils

DESCRIPTION="User Defined Library for InterBase / Firebird / Yaffil for Windows and Unix"
HOMEPAGE="http://sourceforge.net/projects/rfunc/"
SRC_URI="mirror://sourceforge/rfunc/${PN}-${PV}-RC1-unix.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND=">=dev-db/firebird-2.1"

RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}/source"
	sed -e s:"GDS_NAME":"#GDS_NAME": -i rfunc.conf
	echo "GDS_NAME = fbclient" >> rfunc.conf
	echo "IBASE = /usr/lib/firebird" >> rfunc.conf
}

src_compile(){
	cd "${WORKDIR}/source"
	make -f makefile.linux rfunc
}

src_install(){
	exeinto /usr/lib/firebird/UDF
	doexe "${WORKDIR}/source/rfunc"

	insinto /usr/share/firebird/rfunc
	doins "${WORKDIR}/sql/rfunc6.sql"
}

pkg_postinst(){
	elog
	elog "To register rfunc in database run:"
	elog "fbsql -U SYSDBA -P masterkey dbname.gdb < /usr/share/firebird/rfunc/rfunc6.sql"
	elog
}
