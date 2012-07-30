# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit perl-module

DESCRIPTION="WebService-RTMAgent Perl module for RememberTheMilk"
HOMEPAGE="http://search.cpan.org/search?query=WebService-RTMAgent&mode=dist"
SRC_URI="mirror://cpan/authors/id/R/RU/RUTSCHLE/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-perl/libwww-perl
	dev-perl/XML-Simple
	dev-lang/perl"
RDEPEND="${DEPEND}"
