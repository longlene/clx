# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit perl-module

DESCRIPTION="Ora2Pg is a free tool used to migrate an Oracle database to a PostgreSQL compatible schema"
HOMEPAGE="http://ora2pg.darold.net/"
SRC_URI="https://github.com/darold/ora2pg/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="mysql oracle"

DEPEND="
	dev-lang/perl
"
RDEPEND="${DEPEND}
	mysql? ( dev-perl/DBD-mysql )
	oracle? ( dev-perl/Oracle )
"
