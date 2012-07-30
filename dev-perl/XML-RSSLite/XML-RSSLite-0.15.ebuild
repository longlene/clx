# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="Perl module for \"relaxed\" RSS parsing"
HOMEPAGE="http://search.cpan.org/~jpierce"
SRC_URI="mirror://cpan/authors/id/J/JP/JPIERCE/${P}.tgz"


LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"

SRC_TEST="do"

