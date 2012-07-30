# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs eutils

DESCRIPTION="Extract Syskey bootkey from the system hive file"
HOMEPAGE="http://ophcrack.sourceforge.net/bkhive.php"
SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/ophcrack/bkhive-1.1.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

src_compile() {
	cd ${WORKDIR}/${PV}
	emake || die "emake failed"
}

src_install() {
	cd ${WORKDIR}/${PV}
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README AUTHORS ChangeLog
}

