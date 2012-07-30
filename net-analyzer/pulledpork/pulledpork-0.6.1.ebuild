# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Perl script for Snort rule management"
HOMEPAGE="http://code.google.com/p/pulledpork/"
SRC_URI="http://pulledpork.googlecode.com/files/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/perl
	dev-perl/libwww-perl
	dev-perl/Crypt-SSLeay
	perl-core/Sys-Syslog
	perl-core/Digest-MD5
	perl-core/Archive-Tar
	perl-core/File-Spec
	net-analyzer/snort"

src_install () {
	dobin pulledpork.pl || die
	dodoc README \
		doc/README.* \
		etc/*.conf || die
	docinto contrib
	dodoc contrib/* || die
}

pkg_postinst() {
	elog "Example configuration files can be found in /usr/share/doc/${PF}."
}
