# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit perl-app

DESCRIPTION="pgtop - a top clone for postgresql"
HOMEPAGE="http://search.cpan.org/~cosimo/pgtop-0.04/"
SRC_URI="http://search.cpan.org/CPAN/authors/id/C/CO/COSIMO/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="alpha amd64 ppc sparc x86"
SLOT="0"
IUSE=""

DEPEND="dev-perl/DBD-Pg
	virtual/perl-Getopt-Long
	dev-perl/TermReadKey
	dev-perl/Term-ANSIColor
	virtual/perl-Time-HiRes
	>=sys-apps/sed-4"

src_install() {
	perl-module_src_install
}

pkg_postinst() {
	elog "You will need one or more of the following configurations in"
	elog "/var/lib/postgresql/data/postgresql.conf to get query per"
	elog "second statistics:"
	elog "    stats_start_collector = on"
	elog "    stats_command_string = on"
	elog "    stats_block_level = on"
	elog "    stats_row_level = on"
	elog "    stats_reset_on_server_start = on"
}

