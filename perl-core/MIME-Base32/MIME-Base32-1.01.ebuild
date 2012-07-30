# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/MIME-Base64/MIME-Base64-3.07.ebuild,v 1.13 2007/04/15 21:06:22 corsair Exp $

inherit perl-module

DESCRIPTION="A base32/quoted-printable encoder/decoder Perl Modules"
HOMEPAGE="http://search.cpan.org/~danpeder/${P}/"
SRC_URI="mirror://cpan/authors/id/D/DA/DANPEDER/${P}.tar.gz"

LICENSE="|| ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sh sparc x86"
IUSE=""

SRC_TEST="do"

DEPEND="dev-lang/perl"
