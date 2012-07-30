# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="0"
inherit perl-module

DESCRIPTION="Communicate with a Radius server from Perl"
AUTHOR="MANOWAR"
HOMEPAGE="http://search.cpan.org/~manowar/"
SRC_URI="mirror://cpan/authors/id/${AUTHOR:0:1}/${AUTHOR:0:2}/${AUTHOR}/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

SRC_TEST="do"

export OPTIMIZE="$CFLAGS"
DEPEND=">=perl-core/Digest-MD5-2.20
	>=perl-core/IO-1.12
	>=dev-perl/Data-HexDump-0.02
	dev-lang/perl"

S=${WORKDIR}/Authen-Radius-${PV}
src_unpack() {
	perl-module_src_unpack

	sed -i "s:/etc/raddb:${D}/etc/raddb:" "${S}/install-radius-db.PL"
}
