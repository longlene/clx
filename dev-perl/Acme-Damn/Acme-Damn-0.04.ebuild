# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MODULE_AUTHOR="IBB"
inherit perl-module

DESCRIPTION="'Unbless' Perl objects"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

SRC_TEST="do"

COMMON="dev-lang/perl"
DEPEND="${COMMON}"
RDEPEND="${COMMON}
	dev-perl/Test-Exception"
