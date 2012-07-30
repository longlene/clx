# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils perl-module

DESCRIPTION="Perl bindings for the Asterisk AGI"
HOMEPAGE="http://asterisk.gnuinter.net/"
SRC_URI="http://asterisk.gnuinter.net/files/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/perl"

mydoc="README LICENSE CHANGES examples/*"

pkg_setup() {
	einfo "Checking your perl installation..."
	if has_version '<dev-lang/perl-5.8.8' && built_with_use 'dev-lang/perl' minimal; then
		eerror "Your perl was built with the 'minimal' USE flag."
		eerror "asterisk-perl will not build in these conditions."
		eerror "Re-emerge dev-lang/perl with the 'minimal' flag unset."
		die "perl with 'minimal' use flag found"
	fi
	einfo "Everything is fine, continuing..."
}
