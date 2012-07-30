# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="0"
inherit perl-module

DESCRIPTION="Dumps the content of a scalar in hexadecimal"
AUTHOR="FTASSIN"
HOMEPAGE="http://search.cpan.org/~ftassin/"
SRC_URI="mirror://cpan/authors/id/${AUTHOR:0:1}/${AUTHOR:0:2}/${AUTHOR}/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

SRC_TEST="do"

export OPTIMIZE="$CFLAGS"
DEPEND="dev-lang/perl"

src_unpack() {
        perl-module_src_unpack
	mv ${S}/hexdump ${S}/hexdump.pl
	sed -i "s:hexdump:hexdump.pl:" "${S}/Makefile.PL"
	sed -i "s:hexdump:hexdump.pl:" "${S}/MANIFEST"
	sed -i "s:hexdump:hexdump.pl:" "${S}/hexdump.pl"
}

src_install() {
	perl-module_src_install
}
