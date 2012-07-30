# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="hypersrc is a GTK+/GNOME program for browsing source code"
HOMEPAGE="http://www.jimbrooks.org/web/hypersrc/"
SRC_URI="ftp://ftp.jimbrooks.org/hypersrc/latest/${P}.tar.gz"
LICENSE="GPL"
KEYWORDS="~x86"
DEPEND="gnome-base/gnome-libs
		>=x11-libs/gtk+-1.2.6
		dev-lang/perl
		dev-util/ctags"
		
S=${WORKDIR}/${PN}
MAKEOPTS=${MAKEOPTS/-j?/-j1}

src_compile() {
	cd ${S}
	./configure.sh
	emake C_OPTIMIZE="${CFLAGS}" C_OPTS="-DHYPERSRC_SPEED -DG_DISABLE_ASSERT" || die "emake failed"
#	emake C_OPTIMIZE=${CFLAGS} || die "emake failed"
	sed -i -e 's:\$hypersrc = "hypersrc":\$hypersrc = "/usr/lib/hypersrc/hypersrc":' \
			-e 's:\$ctags_pl = "ctags.pl":\$ctags_pl = "/usr/lib/hypersrc/ctags.pl":' \
				Hypersrc.pl
}

src_install() {
	dodoc INSTALL.txt LICENSE.txt README.txt
	doman hypersrc.1
	dodir /usr/lib/hypersrc
	exeinto /usr/lib/hypersrc
	newexe ${S}/out/hypersrc hypersrc
	newexe ${S}/ctags.pl ctags.pl
	exeinto /usr/bin
	newexe ${S}/Hypersrc.pl hypersrc
}
