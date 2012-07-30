# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR="RYBSKEJ"
inherit perl-module

DESCRIPTION="drop-in replacement for Perl threads using fork()"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SRC_TEST="do"

COMMON="dev-lang/perl"
RDEPEND="${COMMON}"
DEPEND="dev-perl/extutils-depends
	dev-perl/extutils-pkgconfig
	dev-perl/Devel-Symdump
	dev-perl/Acme-Damn
	dev-perl/Sys-SigAction
	${COMMON}"
