# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR=BRAAM
MODULE_A_EXT=tar.gz
inherit perl-module

DESCRIPTION="Perl extension for using UUID interfaces as defined in e2fsprogs."

SLOT="0"
LICENSE="Artistic"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
