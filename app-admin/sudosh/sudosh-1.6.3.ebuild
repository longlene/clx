# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils


DESCRIPTION="sudosh is a sudo shell, filter and can be used as a login shell. Sudosh records all keystrokes and output and can play back the session as just like a VCR."
HOMEPAGE="http://sourceforge.net/projects/sudosh"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RDEPEND=""
DEPENDS="virtual/logger"
S=${WORKDIR}/${P}

src_compile() {
	econf --with-defshell || die
	emake || die
}

src_install() {
	einstall || die
	dodoc README INSTALL ChangeLog AUTHORS NEWS COPYING
}

#src_test() {
#	einfo "Running tests"
#	emake check
#}

pkg_postinst() {
	einfo "Configure sudosh to be used with sudo"
	einfo "====================================="
	einfo "1) configure /etc/sudoers to allow system administrators to execute"
	einfo "/usr/bin/sudosh"
	einfo ""
	einfo "Example entry to /etc/sudoers:"
	einfo ""
	einfo "-- /etc/sudoers begin --"
	einfo "User_Alias      ADMINS=admin1,admin2,admin3"
	einfo "User_Alias      DBAS=dba1,dba2,dba3"
	einfo "Cmnd_Alias      SUDOSH=/usr/bin/sudosh"
	einfo ""
	einfo "ADMINS          ALL=SUDOSH"
	einfo "DBAS            ALL=(oracle)/usr/bin/sudosh"
	einfo ""
	einfo "-- /etc/sudoers end --"
			
	sudosh -i || die
	einfo "Updating /etc/shells"
	{ grep -v "^/usr/bin/sudosh$" /etc/shells;
	echo "/usr/bin/sudosh"
	} > ${T}/shells
	mv -f ${T}/shells /etc/shells
}
