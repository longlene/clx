# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Automated podcast download"
HOMEPAGE="http://podracer.sourceforge.net/"
SRC_URI="mirror://sourceforge/$PN/$P.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash
	net-misc/curl"

src_compile() {
	gunzip podracer.1.gz;
}

src_install() {
	dosed "s:sample=/usr/share/doc/\$progname/sample.subscriptions:sample=/usr/share/doc/$PF/sample.subscriptions" podracer;
	dobin podracer;
	dodoc CREDITS LICENSE README ChangeLog TODO;
	doman podracer.1;
	insinto /usr/share/doc/$PF;
	doins sample.subscriptions;
	insinto /etc/;
	doins podracer.conf;
}
