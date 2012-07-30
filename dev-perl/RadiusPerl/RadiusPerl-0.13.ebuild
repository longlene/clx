# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="0"

inherit perl-module

DESCRIPTION="Communicate with a Radius server from Perl"
HOMEPAGE="http://search.cpan.org/search?query=${PN}&mode=dist"
SRC_URI="mirror://cpan/authors/id/M/MA/MANOWAR/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=perl-core/Digest-MD5-2.20
	>=perl-core/IO-1.12
	>=dev-perl/Data-HexDump-0.02
	dev-lang/perl"

S=${WORKDIR}/Authen-Radius-${PV}

# test is interactive
#SRC_TEST="do"

src_unpack() {
	perl-module_src_unpack

	sed -i "s:/etc/raddb:${D}/etc/raddb:" "${S}/install-radius-db.PL"
}
