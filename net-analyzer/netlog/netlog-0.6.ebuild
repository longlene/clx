# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module eutils

DESCRIPTION="NetLog is a simple network traffic monitor."
HOMEPAGE="http://netlog.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="dev-lang/perl
	dev-perl/Date-Calc
	virtual/cron"

src_compile() {
	export PERL_MM_USE_DEFAULT=1
	perl-module_src_prep

	perl-module_src_compile

	rm -f MANIFEST*
}

src_install() {
	perl-module_src_install
}

pkg_postinst() {
	perl-module_pkg_postinst

	einfo
	einfo "If you want netlog to update the database automatically you have to create"
	einfo "a cronjob. Use the command line option '-u' to update the database."
	einfo "See /usr/share/doc/${PF}/README.bz2 and 'man netlog' for further"
	einfo "information."
	einfo
}
